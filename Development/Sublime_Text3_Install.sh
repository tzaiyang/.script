#!/bin/bash

#Install the GPG key:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#Ensure apt is set up to work with https sources:
sudo apt-get install apt-transport-https
#Select the channel to use:
	#Stable
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	#Dev
	echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#Update apt sources and install Sublime Text
sudo apt-get update
sudo apt-get install sublime-text



#uninstall
#sudo apt-get remove sublime-text

#Chinese Input method Setting
sudo apt-get update && sudo apt-get upgrade
git clone https://github.com/lyfeyaj/sublime-text-imfix.git
cd sublime-text-imfix
./sublime-imfix

cd ..
sudo rm -r sublime-text-imfix 

#Done!Re-login X windows,And then you can enjoy using Sublime Text 3 with Fctix Input Method!
#Note!!! open sublime Text with subl on terminal


