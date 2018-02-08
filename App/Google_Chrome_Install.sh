#!/bin/bash
set -e
# HOME_DIR=$PWD

# wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# cd /tmp

# sudo dpkg -i google-chrome-stable_current_amd64.deb
# sudo apt-get -f install

# rm *.deb
# cd HOME_DIR


#通过 PPA 源安装
#首先安装密钥
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#添加 PPA 源
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt-get install google-chrome-stable
#sudo apt-get install google-chrome-beta

