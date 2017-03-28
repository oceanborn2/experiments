# URLs

// http://marcofranssen.nl/packer-io-machine-building-and-provisioning-part-1/
//https://www.debian.org/releases/stable/example-preseed.txt - debian preseed

https://github.com/mitchellh/packer/issues/653

I had this error with the OpenStack builder and simply specifying

  "use_floating_ip": true,
  "floating_ip_pool": "public",


            "proxy":"http://10.61.3.151:3128"

#cat EOF  > > "${MNT_DIR}/etc/profile"
# export http_proxy="http://10.61.3.151:3128"
#export ftp_proxy="http://10.61.3.151:3128"
#EOF

