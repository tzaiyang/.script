#! /bin/bash
# #ubuntu12.04 cross compile
mkdir tarball
mkdir lib

cp ../../A33_SDK/dragonboard/buildroot/dl/openssh-5.8p1.tar.gz ./tarball/
cp ../../A33_SDK/dragonboard/buildroot/dl/openssl-1.0.0d.tar.gz ./tarball/
cp ../../A33_SDK/dragonboard/buildroot/dl/zlib-1.2.5.tar.bz2 ./tarball/

tar xzvf tarball/openssh-5.8p1.tar.gz -C .
tar xzvf tarball/openssl-1.0.0d.tar.gz -C .
tar xjvf tarball/zlib-1.2.5.tar.bz2 -C .

#编译zlib
cd zlib-1.2.5
./configure --prefix=/home/work/A33_App/ssh/lib/zlib-1.2.5

修改Makefile :
CC=gcc 改为:
CC=arm-linux-gcc
LDSHARED= gcc 改为:LDSHARED=arm-linux-gcc
CPP= gcc - E  改为:CPP=arm-linux-gcc - E
AR= ar rc     改为:AR=arm-linux-ar rc

make 
make install

#openssl
cd openssl-1.0.0d
./Configure --prefix=/home/work/A33_App/ssh/lib/openssl-1.0.0d os/compiler:arm-linux-gnueabi-gcc
make 
make install

# #openssh
 cd openssh-5.8p1
# ./configure -host=arm-linux -with-libs -with-zlib=/home/work/A33_App/ssh/lib/zlib-1.2.5 -with-ssl-dir=/home/work/A33_App/ssh/lib/openssl-1.0.0d -disable-etc-default-login CC=arm-linux-gnueabi-gcc AR=arm-linux-gnueabi-ar
# make
#do not make install
# 3》安装

#1、在 openssh-4.6p1 目录下创建 usr bin 目录，文件临时拷贝到这里，然后统一打包到开发板
mkdir -p bin
mkdir -p usr/sbin
mkdir -p usr/local/bin
mkdir -p usr/local/libexec
mkdir -p usr/local/etc
#sshd 工作目录
# mkdir -p var/run
# mkdir -p var/empty/sshd
# chmod sshd var/empty

cp sshd ./usr/sbin #2、将 openssh-4.6p1目录下的 sshd 拷贝到 目标板的 /usr/sbin 目录下
cp scp  sftp  ssh  ssh-add  ssh-agent  ssh-keygen  ssh-keyscan ./usr/local/bin #3、将 copy scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan 到目标板/usr/local/bin目录下
cp sshd_config ssh_config ./usr/local/etc #4、将 sshd_config ssh_config 拷贝到 /usr/local/etc/ 目录下
cp sftp-server  ssh-keysign ./usr/local/libexec #5、将 sftp-server  ssh-keysign 到 /usr/local/libexec

#6、在主机上生成密钥
ssh-keygen -t ecdsa -f ssh_host_ecdsa_key -N ""
ssh-keygen -t rsa -f ssh_host_rsa_key -N ""
ssh-keygen -t dsa -f ssh_host_dsa_key -N ""
#将生成的 ssh_host_*_key这3个文件copy到./usr/local/etc/目录下
cp ssh_host_* ./usr/local/etc/

#8、打包
mkdir ../final 
cp -r bin usr ../final 
cd ../final 
#tar czvf openssh.tgz ./ 
#将 openssh.tgz 拷贝到开发板根目录解压


