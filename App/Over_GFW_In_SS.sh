#!/bin/bash
#服务器端



#su - root
set -e

#客户端
#参考http://blog.csdn.net/u012810317/article/details/52139361
sudo apt-get install shadowsocks
sudo cp /etc/shadowsocks/config.json /etc/shadowsocks/config.json.bak
sudo cat ../Surport/shadowsocks.json > /etc/shadowsocks/config.json

#开机自启设置 
#方案1
sudo apt-get install supervisor
sudo cat ../Surport/supervisord.conf >> /etc/supervisor/supervisord.conf
sudo service supervisor restart
#在exit 0上一行加入以下内容：service supervisor start
sed -i -e 's|exit\ 0|service\ supervisor\ start\nexit\ 0|' /etc/rc.local
#方案2
#sed -i -e '/usr/bin/sslocal -c ~/.script/shadowsocks.json'  /etc/rc.local

#网络代理改成Automatic:   Socks Host:127.0.0.1:1080
sudo apt-get install python-pip python-dev build-essential
sudo pip install genpac
genpac --proxy="SOCKS5 127.0.0.1:1080" -o ../Surport/autoproxy.pac --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
#设置全局代理
#点击：System settings > Network > Network Proxy ; 
#选择 Method 为 Automatic 
#设置 Configuration URL 为 autoproxy.pac 文件的路径(file:///home/ryan/.script/Surport/autoproxy.pac)
#点击 Apply System Wide。 
#格式如：file:///home/{user}/vpnPAC/autoproxy.pac
