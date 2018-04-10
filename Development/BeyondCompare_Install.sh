#!/bin/bash
set -e
. Surport/Default_Varible.sh
wget -P $DownloadAddress http://www.scootersoftware.com/bcompare-4.2.4.22795_amd64.deb
sudo apt-get update
sudo apt-get install gdebi-core 
sudo gdebi $DownloadAddress/bcompare-4.2.4.22795_amd64.deb

#Terminal Uninstall
#sudo apt-get remove bcomparem
