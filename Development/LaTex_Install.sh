#!/bin/bash
#安装过程中需要调用 Perl 的模块 Digest::MD5 来检测 ISO 文件的完整性；升级过程中界面需要调用 Perl 的模块 Tk:
sudo apt-get install libdigest-perl-md5-perl perl-tk
#挂载iso镜像：(在硬盘里有备份)
sudo mount -o loop texlive2017.iso /mnt/
cd /mnt
sudo ./install-tl -gui

#设置环境变量：
#sudo gedit ~/.bashrc
#打开之后在文本最后添加：

echo 'export MANPATH=${MANPATH}:/usr/local/texlive/2017/texmf-dist/doc/man' >> .bashrc
echo 'export INFOPATH=${INFOPATH}:/usr/local/texlive/2017/texmf-dist/doc/info' >> .bashrc
echo 'export PATH=${PATH}:/usr/local/texlive/2017/bin/x86_64-linux' >> .bashrc

source ~/.bashrc
#卸载iso镜像：

cd ..
sudo umount /mnt/


#配置sublime text 3
#打开sublime text，ctrl + shift + p，输入install package，输入LaTeXtools，安装。
#Preference - Package Settings - LaTeXtools - Settings user
#将"texpath" : "$PATH:/usr/texbin",
#改为：
#"texpath" : "$PATH:/usr/local/texlive/2016/bin/x86_64-linux",
#保存，退出。
