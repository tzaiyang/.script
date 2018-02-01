#!/bin/bash

HOME_DIR=$PWD

#dependence download and install
# wget -P ~/Downloads http://ftp.br.debian.org/debian/pool/main/libs/libsidplay/libsidplay1_1.36.59-6_amd64.deb
# wget -P ~/Downloads http://ftp.br.debian.org/debian/pool/main/x/x264/libx264-142_0.142.2431+gita5831aa-1+b2_amd64.deb
# wget -P ~/Downloads http://ftp.br.debian.org/debian/pool/main/g/gst-plugins-ugly0.10/gstreamer0.10-plugins-ugly_0.10.19-2.1_amd64.deb
# cd ~/Downloads

# sudo dpkg -i libsidplay1_1.36.59-6_amd64.deb
# sudo dpkg -i libx264-142_0.142.2431+gita5831aa-1+b2_amd64.deb
# sudo dpkg -i gstreamer0.10-plugins-ugly_0.10.19-2.1_amd64.deb


#youdao-dict install
wget -P /tmp http://codown.youdao.com/cidian/linux/youdao-dict_1.1.0-0-ubuntu_amd64.deb
cd /tmp

sudo dpkg -i youdao-dict_1.1.0-0-ubuntu_amd64.deb
sudo apt-get -f install
sudo dpkg -i youdao-dict_1.1.0-0-ubuntu_amd64.deb

#delete the install package
rm *deb

cd HOME_DIR