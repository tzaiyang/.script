#!/bin/sh
# dragonboard
cd 
ln -s /dragonboard/bin/config.txt /system/vendor/modules/
ln -s /dragonboard/bin/fw_bcm40181a2.bin /system/vendor/modules/
ln -s /dragonboard/bin/nvram_ap6210.txt /system/vendor/modules/
#启动wlan0
ifconfig wlan0 up 
#配置一个静态IP
ifconfig wlan0 192.168.1.25
#写入配置
wpa_passphrase "AIWAC" "epic2012" > wifi.conf
#启动配置
wpa_supplicant -B -i wlan0 -Dwext -c ./wifi.conf
iwconfig wlan0 
#Setting gateway
route add default gw 192.168.1.201
#dhcp自动分配IP
udhcpc -iwlan0