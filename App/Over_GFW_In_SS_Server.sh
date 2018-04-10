#!/bin/bash 
#CentOS6.9x64 Server

# --------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------- #
#  Setting your password 
#          port number
#          and encrypt method
#          from Surport/shadowsocks_multiport.json 
#          and  Surport/shadowsocks_singleport.json
# --------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------- #

#从DigitOcean买San Francisco的$5/mon的服务器,装CentOS6.9x64系统,创建成功后,root密码会发到账号邮箱.
function Proxy_For_SingleUser {
    sudo cp Surport/shadowsocks_singleport.json /etc/shadowsocks.json 
}
function Proxy_For_MultiUser {
    sudo cp Surport/shadowsocks_multiport.json /etc/shadowsocks.json
}

function shadowsocks_start {
    /etc/init.d/shadowsocks start
}
function shadowsocks_stop {
    /etc/init.d/shadowsocks stop
}
function shadowsocks_restart {
    /etc/init.d/shadowsocks restart
}
function shadowsocks_status {
    /etc/init.d/shadowsocks status
}
function Install {
    echo intalling shadowsocks server 
    wget --no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh
    chmod +x shadowsocks.sh
    ./shadowsocks.sh 2>&1 | tee shadowsocks.log
    # 设置密码,端口号:如8989,加密方式:如AES-256-CFB
}
function Uninstall {
    echo unintall shadowsocks server 
    ./shadowsocks.sh uninstall
}
function main {
    Install
    Proxy_For_MultiUser
    shadowsocks_start
    shadowsocks_restart
}

main