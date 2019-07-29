# sshXerver
## Introduction
Setting up remote desktop by means of ssh connecting 
## Instruction
### ssh server:
As X client,run the GUI programs
> vim /etc/ssh/sshd_config  
> uncomment X11Forwarding yes  
> setting X11DisplayOffset=10  
> export DISPLAY=ip(ssh client):0.0(refrence ssh client $DISPLAY)
### ssh client:
##### ->ubuntu Xserver
As X server,display the desktop of ssh server
> vim /etc/ssh/ssh_config    
> uncomment ForwardX11 yes  
> vim /etc/X11/xinit/xerverrc  
> exec /usr/bin/X11/X -dpi 100 -nolisten tcp -> exec /usr/bin/X11/X -dpi 100  
> xhost +ip(ssh server)  
> cat $DISPLAY  


##### ->MacOS Xserver config
reference url(https://cloud.tencent.com/developer/article/1149087)
###### install xquartz (xserver)
> brew cask install xquartz

### ssh connecting 
> ssh -X username@remoteip (on ssh client)  
> run GUI programs (on ssh server)