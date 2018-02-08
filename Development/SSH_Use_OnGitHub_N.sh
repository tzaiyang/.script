#!/bin/bash
#查看是否已经存在ssh秘钥
#打开git bash，输入
$ cd ~/.ssh
$ ls
#如果，提示不存在此目录，则进行第二步操作，否则，你本机已经存在ssh公钥和私钥，可以略过第二步，直接进入第三步操作。

#生成ssh秘钥
ssh-keygen -t rsa -C "tzaiyang@github.com"
#代码参数含义：
#-t 指定密钥类型，默认是 rsa ，可以省略。
#-C 设置注释文字，比如邮箱。
#-f 指定密钥文件存储文件名。
#根据提示，需要指定文件位置和密码，如果是你足够放心，其实都可以直接回车，不需要什么密码。执行完以后，可在/c/Users/you/.ssh/路径下看到刚生成的文件：id_rsa和id_rsa.pub。即公钥和私钥。


# 在GitHub账户中添加公钥

# 登录你的github，头像处下拉框选择settings。
# 进入设置页后点击侧边栏的SSH and GPG keys按钮。
# 点击New SSH key,title可以任意填，并且将上一步骤生成的id_rsa.pub的内容复制到这里的key输入框中。
# 确认
ssh -T git@github.com


# !!!!!!
# 在这里我收到一个提示：
# The authenticity of host 'github.com (192.30.252.128)' can't be established.
# 说是主机密钥验证失败,  后来google了老半天时间发现是缺少了 known_hosts 文件, 而且必须生成 github.com 的ip执行内容.  如下:
# The authenticity of host 'github.com (192.30.252.131)' can't be established.
# RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
# Are you sure you want to continue connecting (yes/no)? yes    #这里写 yes# 


# !!!!!!!