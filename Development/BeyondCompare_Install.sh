#!/bin/bash

#Terminal Install
wget -P /tmp http://www.scootersoftware.com/bcompare-4.2.4.22795_amd64.deb
sudo apt-get update
sudo apt-get install gdebi-core
cd /tmp  
sudo gdebi bcompare-4.2.4.22795_amd64.deb

#Terminal Uninstall
#sudo apt-get remove bcomparem
