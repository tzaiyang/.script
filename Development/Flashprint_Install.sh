#!/bin/bash
## 3D printer software
wget -P $HOME/Downloads http://www.ishare3d.com/3dapp/public/FlashPrint-ii/FlashPrint/flashprint_3.22.0_amd64.deb
cd $HOME/Downloads
sudo dpkg -i flashprint_3.22.0_amd64.deb
sudo apt-get install -f 
sudo dpkg -i flashprint_3.22.0_amd64.deb
