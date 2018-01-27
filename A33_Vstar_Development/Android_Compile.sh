#1.环境准备:
ubuntu16.04
u-boot-tools(lichee编译需要)
make(version-3.81) (android编译需要)
Sun/Oracle JDK(Java SE 1.6) (android编译需要)
python2.7(python3.5会报错)

#遇到过的坑


#编译lichee时:
# scripts/Makefile.build:307: recipe for target 'net/netfilter/xt_mark.o' failed
# make[2]: *** [net/netfilter/xt_mark.o] Error 1
# make[2]: *** Waiting for unfinished jobs....
# ERROR: build kernel Failed

#编译平台:ubuntu16.04
#解决方法:重新解压缩,重新编译.成功.(需要提前装好:sudo apt-get install u-boot-tools)
#原因:之前用的在windows下用2345解压软件解压好的lichee,而在2345解压tar.bz2压缩包时提示存在xt_MARK.h,是否覆盖...,总之,用2345解压linux下的压缩格式会出问题.


#compile android
http://blog.csdn.net/jazzsoldier/article/details/78140554


