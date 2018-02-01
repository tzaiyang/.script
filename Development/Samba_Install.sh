#!/bin/bash -e
#su - root
#sudo apt-get upgrade
sudo apt-get update
sudo apt-get install samba

sudo cat ../Surport/samba_share.conf >> /etc/samba/smb.conf
sudo service smbd restart

