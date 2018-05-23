## 开机慢的原因记录：
Swap分区与/etc/fstab记录不一致
### 查看swap uuid:
> sudo blkid

## 查找目录下的所有文件中是否含有某个字符串 
> find .|xargs grep -ri "IBM"  
> find .|xargs grep -ri "IBM" -l (只打印出文件名) 

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
