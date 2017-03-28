#!/bin/bash

# https://wiki.archlinux.org/index.php/offline_installation_of_packages#Connected_Computer

#wget ftp://ftp.archlinux.org/core/os/x86_64/core.db.tar.gz
#wget ftp://ftp.archlinux.org/extra/os/x86_64/extra.db.tar.gz
#wget ftp://ftp.archlinux.org/community/os/x86_64/community.db.tar.gz
#wget ftp://ftp.archlinux.org/multilib/os/x86_64/multilib.db.tar.gz

mkdir -p var/lib/pacman/sync/{core,extra,community}
rm -r var/lib/pacman/sync/{core,extra,community}/*
tar -xzf core.db.tar.gz      -C var/lib/pacman/sync/core
tar -xzf extra.db.tar.gz     -C var/lib/pacman/sync/extra
tar -xzf community.db.tar.gz -C var/lib/pacman/sync/community
tar -xzf multilib.db.tar.gz  -C var/lib/pacman/sync/multilib
rm -r var/lib/pacman/sync/*.db
cp core.db var/lib/pacman/sync/
cp extra.db var/lib/pacman/sync/
cp community.db var/lib/pacman/sync/


create-arch-pkg-cache.shpacman -Sp --noconfirm cloud-init > pkglist


#To update a New Arch Linux base system after installation you may enter
pacman -Sup --noconfirm > pkglist

#télécharger tous les paquets
wget -nv -i ../pkglist


#in an empty directory. Take all the *.pkg.tar.gz files back home, put them in /var/cache/pacman/pkg and finally run
pacman -S package-name
