#!/bin/bash
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer


#uninstall
#sudo apt-get remove sublime-text-installer

#Chinese Input method Setting
sudo apt-get update && sudo apt-get upgrade
git clone https://github.com/lyfeyaj/sublime-text-imfix.git
cd sublime-text-imfix
./sublime-imfix

cd ..
sudo rm -r sublime-text-imfix 

#Done!Re-login X windows,And then you can enjoy using Sublime Text 3 with Fctix Input Method!
#Note!!! open sublime Text with subl on terminal


