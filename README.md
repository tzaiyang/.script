# .script
## This project including:  
+ Scripts used on Linux platform
+ Notes for usages of command in shell command line
+ List of software on Microsoft Windows platform 

## 开机慢的原因记录：
Swap分区与/etc/fstab记录不一致
### 查看swap uuid:
> sudo blkid

## 查找目录下的所有文件中是否含有某个字符串 
> find .|xargs grep -ri "IBM"  
> find .|xargs grep -ri "IBM" -l (只打印出文件名) 

## 查看文件编码方式
> file filename

## Uncompress
+ .tar.gz  	tar -zXVf xx.tar.gz -C /tmp
+ .tar.bz2      tar -xjvf xx.tar.bz2 -C /tmp
+ .zip          unzip -O cp936 xx.zip (unzip解压缩中文乱码解决方案)

## Default Environment Set
python version set
> sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100  
> sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150  
> python -V  
> sudo update-alternatives --config python (switch python version)  
> sudo update-alternatives --config editor (Nano To Vim)  
> sudo update-alternatives --config java (switch java version)  

## Find the program place
> which vim (program name)

## View the Desktop enviorment
> echo $DESKTOP\_SESSION  
> echo $GDMSESSION  
> env | grep DESKTOP\_SESSION=  

## View the kernel version
> cat /proc/version

## View the release version of Linux
> lsb\_release -a  
> cat /etc/issue  
> cat /etc/lsb-release  
> cat /etc/os-release  

## Rsync (remote sync)

## gpg (encryption signature)

## X11(Xorg) WindowManager(WM) Desktop Enviorment(DE)
### Comand Line -> DE
> startx  
### Comand Line -> Xorg(Xserver)
> xinit  
### Comand Line -> DE(Gnome)
> xinit  
> gnome-session(start WM)  
Xorg是服务端程序，X应用程序是基于Xlib库与X服务器交互，而GTK与QT分别是在Xlib库上又封装了一层方便开发程序。GNOME是基于GTK开发的桌面环境，KDE是基于QT开发的桌面环境。