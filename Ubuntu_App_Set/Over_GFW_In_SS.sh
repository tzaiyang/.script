#!/bin/bash
sudo apt install shadowsocks

sudo apt-get install supervisor
sudo echo $(cat supervisor.conf) >> /etc/supervisor/supervisord.conf
sudo service supervisor restart

#在exit 0上一行加入以下内容：service supervisor start
sed -i -e 's|exit\ 0|service\ supervisor\ start\nexit\ 0|' /etc/rc.local

#网络代理改成Manual:   Socks Host:127.0.0.1:1080
