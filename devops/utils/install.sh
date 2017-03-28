#!/bin/bash

#apt-get install virtualbox
#apt-get install docker
#apt-get install vagrant
#apt-get install chef  # demande une URL serveur http://artemis:4000/chef

# http://devopsu.com/guides/ansible-ubuntu-debian.html
apt-get update
apt-get install python-pip python-dev git -y
pip install PyYAML jinja2 paramiko
git clone https://github.com/ansible/ansible.git
cd ansible
make install
mkdir /etc/ansible
cp examples/hosts /etc/ansible/

