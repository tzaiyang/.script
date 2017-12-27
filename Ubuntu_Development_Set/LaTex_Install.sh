#!/bin/bash
#安装过程中需要调用 Perl 的模块 Digest::MD5 来检测 ISO 文件的完整性；升级过程中界面需要调用 Perl 的模块 Tk:
sudo apt-get install libdigest-perl-md5-perl perl-tk
#挂载iso镜像：(在硬盘里有备份)
sudo mount -o loop texlive2017.iso /mnt/
cd /mnt
sudo ./install-tl -gui
