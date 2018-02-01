#!/bin/bash
set -e
HOME_DIR=$PWD

wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
cd /tmp

sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install

rm *.deb
cd HOME_DIR
