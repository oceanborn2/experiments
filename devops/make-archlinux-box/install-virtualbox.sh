#!/usr/bin/env bash

FQDN='dev.munerot.net'
KEYMAP='fr'
LANGUAGE='fr_FR.UTF-8'
PASSWORD=$(/usr/bin/openssl passwd -crypt 'vagrant')
TIMEZONE='Europe/Paris'

CONFIG_SCRIPT='/usr/local/bin/arch-config.sh'
DISK='/dev/sda'
BOOT_PARTITION="${DISK}1"
SWAP_PARTITION="${DISK}2"
ROOT_PARTITION="${DISK}3"
VAR_PARTITION="${DISK}4"

MNT_DIR='/mnt'

echo "==> clearing partition table on ${DISK}"
/usr/bin/sgdisk --zap ${DISK}

echo "==> destroying magic strings and signatures on ${DISK}"
/usr/bin/dd if=/dev/zero of=${DISK} bs=512 count=2048
/usr/bin/wipefs --all ${DISK}

echo "==> creating /root partition on ${DISK}"
/usr/bin/sgdisk --new=1:0:0 ${DISK}
echo "==> setting ${DISK} bootable"
/usr/bin/sgdisk ${DISK} --attributes=1:set:2

echo "==> Partitioning the disk with required partitions"
/usr/bin/sgdisk -og ${DISK}                                              # Initialize partitioning
/usr/bin/sgdisk -n 1:2048:206847         -c 1:"Boot" -t 1:ef01  ${DISK}  # Boot partition with MBR scheme
/usr/bin/sgdisk -n 2:206848:2304000      -c 2:"Swap" -t 2:8200  ${DISK}	 # Swap partition
/usr/bin/sgdisk -n 3:2304001:52635649    -c 3:"Root" -t 3:8300  ${DISK}  # Linux root filesystem
/usr/bin/sgdisk -n 4:52635650:$ENDSECTOR -c 4:"Var"  -t 4:8300  ${DISK}  # Linux var filesystem

echo "==> printing the partitioning"
/usr/bin/sgdisk -p $1
/usr/bin/fdisk -l
echo "==> printed the partitioning"

echo '==> creating filesystems'
/usr/bin/mkfs.ext4 -F -m 0 -q -L boot ${BOOT_PARTITION}
/usr/bin/mkswap                       ${SWAP_PARTITION}
/usr/bin/mkfs.ext4 -F -m 0 -q -L root ${ROOT_PARTITION}
/usr/bin/mkfs.ext4 -F -m 0 -q -L var  ${VAR_PARTITION}


echo "==> mounting ${ROOT_PARTITION} to ${MNT_DIR}"
/usr/bin/mount -o noatime,errors=remount-ro ${ROOT_PARTITION} "${MNT_DIR}"
/usr/bin/mkdir -p "${MNT_DIR}/boot"
/usr/bin/mount -o noatime,errors=remount-ro ${BOOT_PARTITION} "${MNT_DIR}/boot"
/usr/bin/mkdir -p "${MNT_DIR}/var"
/usr/bin/mount -o noatime,errors=remount-ro ${VAR_PARTITION} "${MNT_DIR}/var"

echo "==> printing MTAB"
cat /etc/mtab
echo "==> printed MTAB"

#PROXYADR=localhost
#PROXYADR=192.168.1.12
#PROXYADR=10.61.3.151
#ping -n 3 ${PROXYADR}

#chmod +x ./setproxy.sh
#. ./setproxy.sh

echo '==> bootstrapping the base installation'
/usr/bin/loadkeys fr
/usr/bin/stty loadkeys fr
/usr/bin/pacstrap    ${MNT_DIR} base base-devel
/usr/bin/arch-chroot ${MNT_DIR} pacman -S --noconfirm gptfdisk openssh syslinux docker cloud-init wget fish nmap vagrant openjdk gpg ghc ruby jdk7-openjdk jdk8-openjdk git apache php php-apache openldap
/usr/bin/arch-chroot ${MNT_DIR} syslinux-install_update -i -a -m
/usr/bin/cat "${MNT_DIR}/boot/syslinux.cfg"
/usr/bin/sed -i 's/TIMEOUT 50/TIMEOUT 10/' "${MNT_DIR}/boot/syslinux/syslinux.cfg"
/usr/bin/cp setproxy.sh ${MNT_DIR}/etc/profile.d
/usr/bin/chmod +x ${MNT_DIR}/etc/profile.d/setproxy.sh


echo '==> generating the filesystem table'
/usr/bin/genfstab -p ${MNT_DIR} > "${MNT_DIR}/etc/fstab"
echo '/swap-file none swap sw 0 0' >> "${MNT_DIR}/etc/fstab"

echo '==> generating the system configuration script'
/usr/bin/install --mode=0755 /dev/null "${MNT_DIR}${CONFIG_SCRIPT}"

cat <<-EOF > "${MNT_DIR}${CONFIG_SCRIPT}"
	. /etc/profile.d/setproxy.sh

	/usr/bin/swapon ${SWAP_PARTITION}
	echo '${FQDN}' > /etc/hostname
	/usr/bin/ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
	echo 'KEYMAP=${KEYMAP}' > /etc/vconsole.conf
	/usr/bin/sed -i 's/#${LANGUAGE}/${LANGUAGE}/' /etc/locale.gen
	/usr/bin/locale-gen
	/usr/bin/mkinitcpio -p linux
	/usr/bin/usermod --password ${PASSWORD} root
	# https://wiki.archlinux.org/index.php/Network_Configuration#Device_names
	/usr/bin/ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
	/usr/bin/ln -s '/usr/lib/systemd/system/dhcpcd@.service' '/etc/systemd/system/multi-user.target.wants/dhcpcd@eth0.service'
	/usr/bin/sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
	/usr/bin/systemctl enable sshd.service

	# VirtualBox Guest Additions
	/usr/bin/pacman -S --noconfirm linux-headers virtualbox-guest-utils virtualbox-guest-dkms
	echo -e 'vboxguest\nvboxsf\nvboxvideo' > /etc/modules-load.d/virtualbox.conf
	guest_version=\$(/usr/bin/pacman -Q virtualbox-guest-dkms | awk '{ print \$2 }' | cut -d'-' -f1)
	kernel_version="\$(/usr/bin/pacman -Q linux | awk '{ print \$2 }')-ARCH"
	/usr/bin/dkms install "vboxguest/\${guest_version}" -k "\${kernel_version}/x86_64"
	/usr/bin/systemctl enable dkms.service
	/usr/bin/systemctl enable vboxservice.service

	# Vagrant-specific configuration
	/usr/bin/groupadd vagrant
	/usr/bin/useradd --password ${PASSWORD} --comment 'Vagrant User' --create-home --gid users --groups vagrant,vboxsf vagrant
	echo 'Defaults env_keep += "SSH_AUTH_SOCK"' > /etc/sudoers.d/10_vagrant
	echo 'vagrant ALL=(ALL) NOPASSWD:	 ALL' >> /etc/sudoers.d/10_vagrant
	/usr/bin/chmod 0440 /etc/sudoers.d/10_vagrant
	/usr/bin/install --directory --owner=vagrant --group=users --mode=0700 /home/vagrant/.ssh
	#/usr/bin/curl --output /home/vagrant/.ssh/authorized_keys --location https://raw.github.com/oceanborn2/keys/oceanborn2.pub
	#/usr/bin/cat oceanborn2.pub > /home/vagrant/.ssh/authorized_keys

	/usr/bin/chown vagrant:users /home/vagrant/.ssh/authorized_keys
	/usr/bin/chmod 0600 /home/vagrant/.ssh/authorized_keys


	# clean up
	/usr/bin/pacman -Rcns --noconfirm gptfdisk
	/usr/bin/pacman -Scc --noconfirm
EOF

echo "==> showing the script"
cat "${MNT_DIR}${CONFIG_SCRIPT}"
echo "==> script shown"

echo '==> entering chroot and configuring system'
/usr/bin/arch-chroot ${MNT_DIR} ${CONFIG_SCRIPT}
#rm "${MNT_DIR}${CONFIG_SCRIPT}"

# http://comments.gmane.org/gmane.linux.arch.general/48739
echo '==> adding workaround for shutdown race condition'
/usr/bin/install --mode=0644 poweroff.timer "${MNT_DIR}/etc/systemd/system/poweroff.timer"
/usr/bin/cp oceanborn2.pub "${MNT_DIR}/home/vagrant/.ssh/authorized_keys"

echo '==> installation complete!'
/usr/bin/sleep 3
/usr/bin/umount ${MNT_DIR}/boot
/usr/bin/umount ${MNT_DIR}/var
/usr/bin/umount ${MNT_DIR}
/usr/bin/swapoff ${SWAP_PARTITION}
/usr/bin/systemctl reboot

