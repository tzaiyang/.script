#!/bin/bash

#先进入命令行模式CTRL+ALT+F1
#禁用X桌面服务
sudo apt-get remove nvidia-*
sudo apt-get autoremove

sudo service lightdm stop
#禁用nouveau驱动。ubuntu默认使用自带的nouveau驱动，在安装NVIDIA驱动前，要先禁止nouveau驱动
#view the permission of file
#ll /etc/modprobe.d/blacklist.conf
#change the permission of blacklist file
sudo chmod 666 /etc/modprobe.d/blacklist.conf
#Disable nouveau driver
echo "blacklist vga16fb" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist rivafb"  >> /etc/modprobe.d/blacklist.conf
echo "blacklist rivatv"  >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidiafb" >> /etc/modprobe.d/blacklist.conf
#chnge the permission to return the origin permission
sudo chmod 644 /etc/modprobe.d/blacklist.conf
#update the kernel
sudo update-initramfs -u
reboot








#confirm the nouveau has been disabled
lsmod |grep nouveau
#install the NVIDIA driver from ppa
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-390

#Important!!!,Disable Secure Boot from BIOS

