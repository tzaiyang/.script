#!/bin/bash
#服务器端
#从DigitOcean买San Francisco的$5/mon的服务器,装CentOS6.9x64系统,创建成功后,root密码会发到账号邮箱.
# tzaiyang账号下:104.236.178.238
# com.tzaiyang账号下:159.89.147.70

#su -root
# wget --no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh
# chmod +x shadowsocks.sh
# ./shadowsocks.sh 2>&1 | tee shadowsocks.log
# # 设置密码,端口号:如8989,加密方式:如AES-256-CFB

# # 安装成功后显示如下:
# # Congratulations, Shadowsocks-python server install completed!
# # Your Server IP        :your_server_ip
# # Your Server Port      :your_server_port
# # Your Password         :your_password
# # Your Encryption Method:your_encryption_method

# # Welcome to visit:https://teddysun.com/342.html
# # Enjoy it!

# #unintall 
# ./shadowsocks.sh uninstall

# #单用户配置文件示例（2015 年 08 月 28 日修正）：
# #配置文件路径：/etc/shadowsocks.json

# {
#     "server":"0.0.0.0",
#     "server_port":your_server_port,
#     "local_address":"127.0.0.1",
#     "local_port":1080,
#     "password":"your_password",
#     "timeout":300,
#     "method":"your_encryption_method",
#     "fast_open": false
# }

# #多用户多端口配置文件示例（2015 年 08 月 28 日修正）：
# #配置文件路径：/etc/shadowsocks.json

# {
#     "server":"0.0.0.0",
#     "local_address":"127.0.0.1",
#     "local_port":1080,
#     "port_password":{
#          "8989":"password0",
#          "9001":"password1",
#          "9002":"password2",
#          "9003":"password3",
#          "9004":"password4"
#     },
#     "timeout":300,
#     "method":"your_encryption_method",
#     "fast_open": false
# }

# #使用命令（2015 年 08 月 28 日修正）：
# #启动：
# /etc/init.d/shadowsocks start
# #停止：
# /etc/init.d/shadowsocks stop
# #重启：
# /etc/init.d/shadowsocks restart
# #状态：
# /etc/init.d/shadowsocks status



#客户端Ubuntu16.04
#su - root
set -e

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
