#!/bin/bash
#Title: Mac_Theme_Uninstall on ubuntu16.04

#2.To Uninstall themes, icons and cursors
cd /usr/share/icons/mac-cursors && sudo ./uninstall-mac-cursors.sh
sudo apt-get remove macbuntu-os-icons-lts-v7 macbuntu-os-ithemes-lts-v7

#5.Use these commands to remove Plank dock themes from your system:
sudo apt-get autoremove plank macbuntu-os-plank-theme-lts-v7

#6.Revert back to 'Ubuntu Desktop' text, enter following commands in the Terminal:
cd && wget -O Ubuntu.po http://drive.noobslab.com/data/Mac/change-name-on-panel/ubuntu.po
cd /usr/share/locale/en/LC_MESSAGES; sudo msgfmt -o unity.mo ~/Ubuntu.po;rm ~/Ubuntu.po;cd

#7.If you want back Ubuntu logo enter following commands in terminal:
wget -O launcher_bfb.png http://drive.noobslab.com/data/Mac/launcher-logo/ubuntu/launcher_bfb.png
sudo mv launcher_bfb.png /usr/share/unity/icons/

#11.If you don't like MBuntu Splash, You can get back Ubuntu splash:
sudo apt-get autoremove macbuntu-os-bscreen-lts-v7

#12.If you want to revert back, You can get back LightDM default look:
sudo apt-get remove macbuntu-os-lightdm-lts-v7

