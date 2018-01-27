#!/bin/bash
#jdk9.0.4 version install
wget http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.tar.gz?AuthParam=1516952759_5242614b27375bbb0bcf4b21236c6707 -o jdk-9.0.4_linux-x64_bin.tar.gz
cat downloading jdk
tar zjvf jdk-9.0.4_linux-x64_bin.tar.gz

cat "export JAVA_HOME=/usr/lib/jvm/jdk-9.0.4" >> /etc/profile
cat "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile
cat "export CLASSPATH=.:$JAVA_HOME/lib" >> /etc/profile

source /etc/profile

sudo update-alternatives --install /usr/bin/java java  /usr/lib/jvm/jdk-9.0.4/bin/java 300
sudo update-alternatives --config java

java -version





#jdk1.6.0_31 version install
下载jdk1.6.0_31.bin
http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html
需要登录oracle account: aiwac2018@163.com/Epic2012

sudo chmod u+x ./jdk1.6.0_31.bin
在当前路径下得到jdk1.6.0_31文件夹,mv ./jdk1.6.0_31/ /usr/lib/jvm/jdk1.6.0_31

5、配置环境变量
sudo gedit /etc/profile 
加入环境变量内容
#set java environment
export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_31
export JRE_HOME=${JAVA_HOME}/jre  
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
export PATH=${JAVA_HOME}/bin:$PATH 


source /etc/profile

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_31/bin/java =500  
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_31/bin/javac 500 

sudo update-alternatives --config java
sudo update-alternatives --config javac

java -version
