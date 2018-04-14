#!/bin/bash
. Surport/Default_Varible.sh
wget -P $DownloadAddress https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i $DownloadAddress/google-chrome-stable_current_amd64.deb
sudo apt-get install -f