#!/bin/bash
#参考链接：http://www.linuxidc.com/Linux/2016-10/136436.htm
#MATLAB 2014B 下载地址（带Crack）： 链接: https://pan.baidu.com/s/1qYngXXi  密码: rfd2

#1、直接解压 matlab_R2014b.iso 到 文件夹 matlab_R2014b/
#2、用 crack 中的 install.jar 替换 matlab_R2014b/java/jar/ 中的install
#注：解压 iso 出来的文件夹很可能是只读的，所以要先给文件夹加权限。
sudo chmod a+w -R matlab_R2014b
#3、运行 matlab_R2014b 目录下的 install：
cd matlab_R2014b
sudo ./install
#接下来就是和windows差不多的安装界面了。
#默认安装目录是 /usr/local/MATALAB/R2014b/ 
#Install key:29797-39064-48306-32452
#接下来的证书文件是 Crack 中的 license.lic
#接下来正常安装，直到完成。
#4、其实之前的激活是不会成功的，因为还没有打补丁。接下来，把 Crack 中的 libmwservices.so 复制到 /usr/local/MATLAB/R2014b/bin/glnxa64/ 中：
#备份原来的文件
sudo mv /usr/local/MATLAB/R2014b/bin/glnxa64/libmwservices.so  /usr/local/MATLAB/R2014b/bin/glnxa64/libmwservices.so.bak  
#把破解补丁拷过来
sudo cp crack/libmwservices.so /usr/local/MATLAB/R2014b/bin/glnxa64/
#执行破解命令
sudo /usr/local/MATLAB/R2014b/bin/activate_matlab.sh -propertiesFile /usr/local/MATLAB/R2014b/etc/activate.ini  
#接下来会再次弹出让你输入证书的窗口，继续找 Crack 中的  license.lic
#5、打开MATLAB：
sudo /usr/local/MATLAB/R2014b/bin/matlab
#现在打开会有问题报下边的错：libGL error:xxx
#然后 Matlab 运行的时候会卡死，只能强制杀进程：
ps -e | grep MAT
kill <PID>
#报错的主要原因是，引起这种错误的原因是Ubuntu15.04及以上版本包含更新版本的libstdc++.so.6，而Matlab使用的是较旧版本（versioin 6.0.17）。当Matlab首先加载 
#/usr/local/MATLAB/R2016a/sys/os/glnxa64 中的libstdc++.so.6.0.17时，操作系统收到一个Matlab引起的不兼容错误（incompatibility），从而引发启动奔溃（crash）。
#解决方法：
#可以强制使Matlab加载由操作系统提供的更新版的libstdc++库，通过以下三个操作完成：
#进入sys/os/glnxa6 目录 
cd /usr/local/MATLAB/R2014b/sys/os/glnxa64 
#重命名libstdc++.so.6 共享库为 libstdc++.so.6.bak 
mv libstdc++.so.6 libstdc++.so.6.bak
#MathWorks官方只对libstdc++.so.6(version 20)做了有限的测试。目前，这个Bug已经在R2016b(9.1)中修复。完毕。
#接下来可以设置环境变量：
sudo vi /etc/profile
#在文件尾添加：
export PATH=/usr/local/MATLAB/R2014b/bin:$PATH
#保存并退出后使设置生效
source /etc/profile

#设置桌面快捷方式
sudo cat ../Surport/MATLAB2014b.desktop >> /usr/share/applications/Matlab_R2014b.desktop

