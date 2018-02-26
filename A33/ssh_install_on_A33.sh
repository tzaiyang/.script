#! /bin/sh

#将ssh_compile.sh生成的usr目录递归拷贝到开发板根目录

#调用Wifi_Config.sh连接wifi

# 确保目标板上有以下目录，如果没有，则新建（目录层次很重要，不要改变）
# /usr/sbin
# /usr/local/bin
# /usr/local/libexec
# /usr/local/etc/

#7、在开发板 bin 目录下创建软连接
ln -s /usr/local/bin/scp 
ln -s /usr/local/bin/sftp 
ln -s /usr/local/bin/ssh 
ln -s /usr/local/bin/ssh-add 
ln -s /usr/local/bin/ssh-agent 
ln -s /usr/local/bin/ssh-keygen 
ln -s /usr/local/bin/ssh-keyscan
#9、启动开发板，添加用户
touch /etc/passwd 
touch /etc/group
mkdir -p /home/sshd
adduser sshd
adduser root
# passwd root #为root用户设置密码

#10、测试
# 一开始提示密钥啥玩意，输入yes再输入密码就可以登录了，也可以直接用windows下的secure crt
vi /usr/local/etc/sshd_config
# 将开发板/usr/local/sshd_config,将PermitRootLogin yes前的注释“#”号去掉
# 如出现如下错误
# Permissions 0755 for '/usr/local/etc/ssh_host_rsa_key' are too open.
# /var/empty must be owned by root and not group or world-writable
# Solve method
chmod 700 /usr/local/etc/ssh_host_ecdsa_key 
chmod 700 /usr/local/etc/ssh_host_dsa_key 
chmod 700 /usr/local/etc/ssh_host_rsa_key 
chmod 744 /var/empty/  
/usr/sbin/sshd 
# ps 可以看到 /usr/sbin/sshd
ps

# 主机上登录测试: $  ssh root@192.168.1.182(要保证先ping通)
# 如果出现问题：
# ssh carlh at 192.168.52.190
# carlh at 192.168.52.190's password: 
# WARNING: Your password has expired.
# You must change your password now and login again!
# Changing password for carlh
# Old password: 
# New password: 
# Retype password: 
# Password for carlh changed by carlh
# Connection to 192.168.52.190 closed.

# Solve method:
cat /etc/shadow
#（和/etc/passwd是一一对应的)
# root:[deleted field]:0:0:99999:7:::
# bin:*:10933:0:99999:7:::
# daemon:*:10933:0:99999:7:::
# adm:*:10933:0:99999:7:::
# lp:*:10933:0:99999:7:::
# sync:*:10933:0:99999:7:::
# shutdown:*:10933:0:99999:7:::
# halt:*:10933:0:99999:7:::
# uucp:*:10933:0:99999:7:::
# operator:*:10933:0:99999:7:::
# nobody:*:10933:0:99999:7:::
# default::10933:0:99999:7:::
# carlh:[deleted field]:0:0:99999:7:::

# Solve Method:
# 把: root:[deleted field]:0:0:99999:7::: 改为:# root:[deleted field]:10932:0:99999:7:::

#主机再次登录
ssh root@192.168.3.182
#成功