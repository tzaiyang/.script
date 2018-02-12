#! /bin/bash
# centos7
# !!!注意不能有git用户和git用户组
# userdel git
# Refrence URL:https://www.cnblogs.com/wenwei-blog/p/5861450.html
yum -y install policycoreutils policycoreutils-python openssh-server openssh-clients postfix
wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/gitlab-ce-10.1.7-ce.0.el7.x86_64.rpm
rpm -i gitlab-ce-10.1.7-ce.0.el7.x86_64.rpm
vim /etc/gitlab/gitlab.rb
# Configure your server ip
# external_url = "http://192.168.3.42"
#ps:注意这里设置的端口不能被占用，默认是8080端口，如果8080已经使用，请自定义其它端口，并在防火墙设置开放相对应得端口
sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart
# 显示以下结果才算成功 
# ok: run: gitaly: (pid 3662) 0s
# ok: run: gitlab-monitor: (pid 3683) 1s
# ok: run: gitlab-workhorse: (pid 3721) 0s
# ok: run: logrotate: (pid 3736) 1s
# ok: run: nginx: (pid 3742) 0s
# ok: run: node-exporter: (pid 3754) 1s
# ok: run: postgres-exporter: (pid 3764) 0s
# ok: run: postgresql: (pid 3775) 0s
# ok: run: prometheus: (pid 3783) 0s
# ok: run: redis: (pid 3797) 0s
# ok: run: redis-exporter: (pid 3802) 1s
# ok: run: sidekiq: (pid 3813) 0s
# ok: run: unicorn: (pid 3823) 1s

#此时在客户端访问http://192.68.3.42,应该就能使用了。

