#!/bin/bash
sudo apt-get install picocom

# how to start
# picocom -b 115200 /dev/ttyUSB0
 
# set alias
# alias pc='picocom -b 115200 /dev/ttyUSB0'
# sudo pc

# ttyUSB driver install
# wget -P ~/Downloads https://www.silabs.com/documents/login/software/Linux_3.x.x_4.x.x_VCP_Driver_Source.zip
# unzip Linux_3.x.x_4.x.x_VCP_Driver_Source.zip
# tar xzvf Linux_3.x.x_4.x.x_VCP_Driver_Source.tar.gz -C ./CP210XDriver
# cd CP210XDriver
# make
# insmod cp210x.ko
# sudo depmod -a
# cp cp210x.ko /lib/modules/.../kernel/drivers/usb/serial
