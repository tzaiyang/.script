#!/bin/bash
#Ubuntu16.04 Client

# --------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------- #
# Setting   your Server IP address,
#           Port number
#           password 
#           and encrypt method
#           From Surport/shadowsocks.json
# Note: You should run this scripts in root user permission
# Note: You should run this scripts in root user permission
# Note: You should run this scripts in root user permission
# --------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------- #

# Refrence: http://blog.csdn.net/u012810317/article/details/52139361
function Install_shadowsocks {
    echo Installing shadowsocks
    sudo apt-get install shadowsocks
    sudo cp /etc/shadowsocks/config.json /etc/shadowsocks/config.json.bak
    sudo cat Surport/shadowsocks.json > /etc/shadowsocks/config.json
}

function Set_Startup {
    echo Setting Start up
    sudo apt-get install supervisor
    sudo cat Surport/supervisord.conf >> /etc/supervisor/supervisord.conf
    sudo service supervisor restart
    # Add "service supervisor start" to above "exit 0"
    sed -i '$i\service supervisor start' /etc/rc.local
}

function Set_Proxy {
    # Setting shadowsocks:Socks Host:127.0.0.1:1080
    echo setting shadowsocks proxy
    sudo apt-get install python-pip python-dev build-essential
    sudo pip install genpac
    genpac --proxy="SOCKS5 127.0.0.1:1080" -o Surport/autoproxy.pac --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
    
    # Refrence:https://www.linuxidc.com/Linux/2015-06/119164.htm
    # Click System settings > Network > Network Proxy ; 
    # Choose Method As Automatic
    gsettings set org.gnome.system.proxy mode 'auto'
    # Setting Configuration URL as autoproxy.pac path(file://$HOME/.script/Surport/autoproxy.pac)
    # Click Apply System Wide
    gsettings set org.gnome.system.proxy autoconfig-url file://$HOME/.script/Surport/autoproxy.pac
}

function Test_Access {
    ping google.com
}

function main {
    set -e
    Install_shadowsocks
    Set_Proxy
    Set_Startup
}

main
