Version And Enviorment
===========================
View the kernel version
   
    $ cat /proc/version

View the release version of Linux

    $ lsb\_release -a  
    $ cat /etc/issue  
    $ cat /etc/lsb-release  
    $ cat /etc/os-release  

View the Desktop enviorment

    $ echo $DESKTOP\_SESSION  
    $ echo $GDMSESSION  
    $ env | grep DESKTOP\_SESSION=  

Find the program place
  
    $ which vim (program name)

查看文件编码方式
   
    $ file filename

Default Environment Set
    
    $ sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100  
    $ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150  
    $ python -V  
    $ sudo update-alternatives --config python (switch python version)  
    $ sudo update-alternatives --config editor (Nano To Vim)  
    $ sudo update-alternatives --config java (switch java version)  
