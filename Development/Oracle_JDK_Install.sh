#!/bin/bash
JDKVERSION="8u181"

function 6u31version {
    #su -root
    #Sun/Oracle JDK(Java SE 1.6)
    #jdk1.6.0_31 version install
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
    exportpath
    update-version6u31
}

function update-version6u31 {
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
}

function 8u181version {
    # wget -P ~/Downloads http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz?AuthParam=1535110139_eff58cb724d8a9a9bd2374d482fb7675
    cd ~/Downloads
    sudo mkdir /opt/jvm
    sudo tar zxvf jdk-8u181-linux-x64.tar.gz -C /opt/jvm

    exportpath
}


function exportpath {
    #加入环境变量内容
    if [ $JDKVERSION = 6u31 ];then 
      sudo echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_31" >> /etc/profile
    elif [ $JDKVERSION = 8u181 ];then
      sudo echo "export JAVA_HOME=/opt/jvm/jdk1.8.0_181" >> /etc/profile
    fi

    sudo echo "export JRE_HOME=\${JAVA_HOME}/jre" >> /etc/profile
    sudo echo "export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib" >> /etc/profile
    sudo echo "export PATH=\${JAVA_HOME}/bin:\$PATH" >> /etc/profile

    source /etc/profile
}


function main {
    if [ $JDKVERSION = 6u31 ];then 
      6u31version
    elif [ $JDKVERSION = 8u181 ];then
      8u181version
    fi      

    echo "java -version command to check if successfully installed"
      
}

main
