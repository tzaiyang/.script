#! /bin/sh
#/dragonboard/bin/wifi_config_on_A33.sh
# mkdir -p /usr/sbin
mkdir -p /usr/local/bin
mkdir -p /usr/local/libexec
mkdir -p /usr/local/etc/

cp /dragonboard/usr/* -r /usr/
# create soft link
ln -s /usr/local/bin/scp /bin
ln -s /usr/local/bin/sftp /bin
ln -s /usr/local/bin/ssh /bin
ln -s /usr/local/bin/ssh-add /bin
ln -s /usr/local/bin/ssh-agent /bin
ln -s /usr/local/bin/ssh-keygen /bin
ln -s /usr/local/bin/ssh-keyscan /bin

# add user
#touch /etc/passwd 
#touch /etc/group
mkdir -p /home/sshd
#adduser sshd
#adduser root
passwd root #set root key

# test 
sed -i 's/#PermitRootLogin/PermitRootLogin/' /usr/local/etc/sshd_config

# Solve method
chmod 700 /usr/local/etc/ssh_host_ecdsa_key 
chmod 700 /usr/local/etc/ssh_host_dsa_key 
chmod 700 /usr/local/etc/ssh_host_rsa_key 
mkdir -p /var/empty/
chmod 744 /var/empty/  

/usr/sbin/sshd 
ps

# test on linux host:$ssh root@192.168.1.218(ping)
# if errors like follow :

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
#cat /etc/shadow
#（/etc/passwd and /etc/shadow are one by one)
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
sed -i 's/:0:0:99999:7:::/:10933:0:99999:7:::/' /etc/shadow                                                                       
#.......Test......
#ssh root@192.168.3.218

