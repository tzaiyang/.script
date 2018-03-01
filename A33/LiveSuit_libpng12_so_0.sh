#!/bin/bash
wget -P /tmp http://mirrors.ustc.edu.cn/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb
cd /tmp
sudo dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb; apt-get install -f
sudo dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb

