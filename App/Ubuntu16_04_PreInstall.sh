#!/bin/bash
#su - root
set -e

#Install VIM
sudo apt-get install vim

#Wubi Input method install
./Wubi_InputMethod_Install.sh

#Dual Screen Setting
#../Startup/monitors.sh

#Over The GFW
./Over_GFW_In_SS.sh

#Sublime_Text3
#../Development/Sublime_Text3_Install.sh

#Youdao Dictionary
./Youdao_Dict_Install.sh

#FoxitReader Install
./FoxitReader_Install.sh

#Google Chrome
./Google_Chrome_Install.sh


