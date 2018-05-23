用户及用户组管理
===============
新建git用户并指定用户组为 git,并自动建立登录目录  
   
    $ useradd git -g git -n -m   
    $ adduser name
查看所有的用户信息
    
    $ cat /etc/passwd
查看所有组信息

    $ cat /etc/group
查看当前登录用户的组内成员

    $ groups 
查看test用户所在的组,以及组内成员

    $ groups root
查看当前登录用户名
    
    $ whoami 
要判断用户是否存在
    
    $ id root
view detail users and actions of users
    
    $ w 
view users

    $ who
logout user
   
    $ w
    $ pkill -kill -t pts/2
