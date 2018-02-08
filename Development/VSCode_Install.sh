#!/bin/bash

wget -P /tmp https://az764295.vo.msecnd.net/stable/7c4205b5c6e52a53b81c69d2b2dc8a627abaa0ba/code_1.19.3-1516876437_amd64.deb
cd /tmp 
sudo dpkg -i code_1.19.3-1516876437_amd64.deb
sudo apt-get install -f



