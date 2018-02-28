#!/bin/sh
# dragonboard
cd 
ln -s /dragonboard/bin/config.txt /system/vendor/modules/
ln -s /dragonboard/bin/fw_bcm40181a2.bin /system/vendor/modules/
ln -s /dragonboard/bin/nvram_ap6210.txt /system/vendor/modules/
# start wlan0
ifconfig wlan0 up 
# config staic IP
ifconfig wlan0 192.168.3.25
# editting configure file 
wpa_passphrase "AIWAC" "epic2012" > wifi.conf
# start wlan0
wpa_supplicant -B -i wlan0 -Dwext -c ./wifi.conf
iwconfig wlan0 
# setting gateway
route add default gw 192.168.3.201
# dhcp
udhcpc -iwlan0
