# shadowsocks: socket5 proxy
nohup ss-local -c /etc/shadowsocks.json >/dev/null 2>&1 &
# privoxy:socket5 proxy->http proxy
sudo /usr/local/sbin/privoxy /usr/local/etc/privoxy/config
#netstat -na | grep 8118
source ~/.zshrc
sson
