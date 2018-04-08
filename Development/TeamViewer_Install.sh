#!/bin/bash
set -e
. ../Surport/Default_Varible.sh
wget -P $DownloadAddress https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
sudo apt-get install -f