#!/bin/bash
#Title: MacBuntu 16.04 Transformation Pack For Ubuntu 16.04 Xenial Xerus
#Referenced from: http://www.noobslab.com/2016/04/macbuntu-1604-transformation-pack-for.html

#1: MacBuntu wallpapers
#Download MacBuntu OS Wallpapers and extract to pictures directory.
#wget -nc -P ~/Pictures http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip

#2: MacBuntu OS Y Theme, Icons and cursors:
sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt-get update
sudo apt-get install macbuntu-os-icons-v10
sudo apt-get install macbuntu-os-ithemes-v10
#After installation choose theme, icons and mac cursor from tweak tool.

#3: Slingscold (Alternative to Launchpad)
#sudo add-apt-repository ppa:noobslab/macbuntu
#sudo apt-get update
sudo apt-get install slingscold
#start to use,run slingscold

#4: Albert Spotlight (Alternative to Mac Spotlight)
#sudo add-apt-repository ppa:noobslab/macbuntu 
#sudo apt-get update 
sudo apt-get install albert
#After installation you can open Albert from Menu/Dash, and first set hotkey to activate albert.

#5: Plank Dock
#This time we chose Plank it seems a best choice for this pack because it doesn't have any kind of issues, it is lightweight and we are providing themes with this pack for Plank dock.
sudo apt-get install plank
#Install themes for Plank dock, enter following commands in terminal:
#sudo add-apt-repository ppa:noobslab/macbuntu
#sudo apt-get update
sudo apt-get install macbuntu-os-plank-theme-v9
plank
#Press "Ctrl + Right Click" on the plank to access context menu.

#Tip: To pin application to dock just open Application and right click on app icon then select 'Keep in dock'.

#6: Replace 'Ubuntu Desktop' text with 'Mac' on the Panel
#cd && wget -O Mac.po http://drive.noobslab.com/data/Mac/change-name-on-panel/mac.po
#cd /usr/share/locale/en/LC_MESSAGES; 
#sudo msgfmt -o unity.mo ~/Mac.po;
#rm ~/Mac.po;
#cd

#If you are using non-English version of Ubuntu then replace /en/ in the above command with your locale. For instance for German version /de/.

#7: Apple Logo in Launcher
#wget -O launcher_bfb.png http://drive.noobslab.com/data/Mac/launcher-logo/apple/launcher_bfb.png
#sudo mv launcher_bfb.png /usr/share/unity/icons/

#8: Tweak Tools to change Themes & Icons:
#sudo apt-get install unity-tweak-tool
sudo apt-get install gnome-tweak-tool

#9: Install Monochrome icons for Libreoffice:
#Human icons are default in LibreOffice which kind of look weird with this transformation pack, to make LibreOffice more elegant with monochrome icons follow these instructions.
#sudo apt-get install libreoffice-style-sifr
#After installation go to LibreOffice menu select "Tools" > "Options" > "LibreOffice" > "View" and select "Sifr" under "Icon size and style". See following screenshots

#10: (Optional) Mac fonts:
#wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
#sudo unzip mac-fonts.zip -d /usr/share/fonts; 
#rm mac-fonts.zip
#sudo fc-cache -f -v
#You can change fonts from Unity-Tweak-Tool, Gnome-Tweak-Tool or Ubuntu Tweak


#Following Tweaks are not recommended to install, sharing because many users are going to ask if we don't. Try on your own risk, if you want to make your OS messed up. YOU HAVE BEEN WARNED!
#11: Apply MacBuntu Boot-screen/Splash:
#sudo add-apt-repository ppa:noobslab/themes
#sudo apt-get update
#sudo apt-get install macbuntu-os-bscreen-lts-v7

#sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/macbuntu/macbuntu.plymouth 100
#sudo update-alternatives --config default.plymouth

#12: (Optional) Install MacBuntu theme for LightDM Webkit Greeter:
#Note: Install only in Ubuntu Unity with Lightdm and Ubuntu Gnome with gdm pre-installed. Don't install it in other Ubuntu flavors.
#Warning: It can make your system unusable. Use this feature on your own risk, last time we received a lot feedback that it is making system stuck on blank screen. Please don't report any blank screen (If happens) issue after installing it. We also faced issues while working with this tweak, sometime it works fine but most of the time it doesn't, I can't guarantee you that it will work for you. You have been warned.
#sudo apt-get install macbuntu-os-lightdm-lts-v7

# su
# echo "greeter-session=lightdm-webkit-greeter" >> /etc/lightdm/lightdm.conf
# echo -e "theme-name=macbuntu-lightdm\nwebkit-theme=macbuntu-lightdm" >> /etc/lightdm/lightdm-webkit-greeter.conf
# exit

#------------------------------------------------------------------------------#
#-----------------------------------I am split line-----------------------------#
#------------------------------------------------------------------------------#

#append comand:!!!
#plank,Albert add to startup application
#add slingcold to plank

# sudo killall plank
# cd ~/.config/plank/dock1/launchers
# cp eog.dockitem ./slingscold.dockitem
# sed -i -e 's|eog.desktop|slingscold.desktop|' slingscold.dockitem
# plank

#After installation reboot PC.




