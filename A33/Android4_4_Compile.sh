#!/bin/bash
# su -root

#1.硬件要求:
内存4G(内存不足，会在编译时出现make:killed的错误）
硬盘100G

#2.软件要求:
#Opera System: ubuntu12.04
#Enviorment:
 #u-boot-tools(lichee编译需要)
sudo apt-get install u-boot-tools
 #GNU Make3.81(android编译需要)
wget http://ftp.gnu.org/pub/gnu/make/make-3.81.tar.gz
tar zxvf make-3.81.tar.gz -C /tmp
sudo rm make-3.81.tar.gz
cd /tmp/make-3.81
./configure --prefix=/usr
make
make check
make install
cd ..
sudo rm -R make-3.81/
 #Sun/Oracle JDK(Java SE 1.6) (android编译需要)
#jdk1.6.0_31 version install(最好用jdk1.6.0_45不过jdk1.6.0_43也能编译成功）
#Download jdk1.6.0_31.bin package
#http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html
#need to login Oracle account: aiwac2018@163.com/Epic2012
cd ~/Downloads
sudo chmod u+x ./jdk-6u31-linux-x64.bin
./jdk-6u31-linux-x64.bin
#在当前路径下得到jdk1.6.0_31文件夹
sudo mkdir /usr/lib/jvm
sudo mv ./jdk1.6.0_31/ /usr/lib/jvm/jdk1.6.0_31
#Config enviorment
#sudo vim /etc/profile 
#加入环境变量内容
sudo echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_31" >> /etc/profile
sudo echo "export JRE_HOME=\${JAVA_HOME}/jre" >> /etc/profile
sudo echo "export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib" >> /etc/profile
sudo echo "export PATH=\${JAVA_HOME}/bin:\$PATH" >> /etc/profile

source /etc/profile

update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_31/bin/javac 1
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_31/bin/java 1
update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_31/bin/javaws 1
update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.6.0_31/bin/jar 1
update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/jdk1.6.0_31/bin/javap 1 
update-alternatives --config javac
update-alternatives --config java
update-alternatives --config javaws
update-alternatives --config jar
update-alternatives --config javap
java -version

#javap 一定要加上，不然会报如下编译错误
#File "/usr/lib/python2.7/subprocess.py", line 1259, in _execute_child  
#raise child_exception
#OSError: [Errno 2] No such file or directory

 #python2.7(python3.5会报错)
 #Other denpendency
sudo apt-get install build-essential cdbs dh-make dkms execstack dh-modaliases fakeroot libqtgui4 debhelper debconf libstdc++6 dkms libqtgui4 linux-headers-generic #libelfg0 
sudo apt-get install lib32gcc1 libc6-i386 #ia32-libs-multiarch:i386 
sudo apt-get install ia32-libs(ubuntu16.04 install lib32z1 lib32ncurses)

#Note!!!
#编译lichee时:
# scripts/Makefile.build:307: recipe for target 'net/netfilter/xt_mark.o' failed
# make[2]: *** [net/netfilter/xt_mark.o] Error 1
# make[2]: *** Waiting for unfinished jobs....
# ERROR: build kernel Failed

#编译平台:ubuntu16.04
#解决方法:重新解压缩,重新编译.成功.(需要提前装好:sudo apt-get install u-boot-tools)
#原因:之前用的在windows下用2345解压软件解压好的lichee,而在2345解压tar.bz2压缩包时提示存在xt_MARK.h,是否覆盖...,总之,用2345解压linux下的压缩格式会出问题.

