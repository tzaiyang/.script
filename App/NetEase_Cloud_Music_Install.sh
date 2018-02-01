#!/bin/bash

#netease-cloud-music install 
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
sudo dpkg -i netease-cloud-music_1.1.0_amd64_ubuntu.deb
sudo apt-get update
sudo apt-get upgrade -f 
sudo dpkg -i netease-cloud-music_1.1.0_amd64_ubuntu.deb

