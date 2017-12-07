#!/bin/bash

#youdao-dict install
wget http://codown.youdao.com/cidian/linux/youdao-dict_1.1.0-0-ubuntu_amd64.deb
wget http://ftp.br.debian.org/debian/pool/main/g/gst-plugins-ugly0.10/gstreamer0.10-plugins-ugly_0.10.19-2.1_amd64.deb
sudo dpkg -i gstreamer0.10-plugins-ugly_0.10.19-2.1_amd64.deb
sudo dpkg -i youdao-dict_1.1.0-0-ubuntu_amd64.deb
sudo apt-get update
sudo apt-get upgrade -f
sudo dpkg -i gstreamer0.10-plugins-ugly_0.10.19-2.1_amd64.deb
sudo dpkg -i youdao-dict_1.1.0-0-ubuntu_amd64.deb
rm gstreamer0.*
rm youdao-dict_1.1.*
