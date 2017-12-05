#!/bin/sh
#Work Directory:HOME
#Preparation
mkdir madplay
cd madplay/
mkdir tarball src-x86 src-arm target-x86 target-arm

MADPLAY_DIR=$PWD
SRC_DIR=src-x86
TARGET_DIR=$MADPLAY_DIR/target-x86

# download libid3tag-0.15.1b.tar.gz libmad-0.15.1b.tar.gz madplay-0.15.2b.tar.gz from ftp://ftp.mars.org/pub/mpeg/
cd tarball
wget ftp://ftp.mars.org/pub/mpeg/libid3tag-0.15.1b.tar.gz
wget ftp://ftp.mars.org/pub/mpeg/libmad-0.15.1b.tar.gz
wget ftp://ftp.mars.org/pub/mpeg/madplay-0.15.2b.tar.gz
wget http://www.zlib.net/zlib-1.2.11.tar.gz

for f in $(ls *.tar.gz); do tar xvzf $f -C ../$SRC_DIR; done
cd ..
#arm-linux-gcc compiler
#export CC=arm-linux-gcc-4.3.2

cd $SRC_DIR/zlib-1.2.11/
./configure --prefix=$TARGET_DIR
make && make install
cd ../../

cd $SRC_DIR/libid3tag-0.15.1b/
./configure --prefix=$TARGET_DIR CPPFLAGS=-I$TARGET_DIR/include LDFLAGS=-L$TARGET_DIR/lib
make
make install
cd ../../

cd $SRC_DIR/libmad-0.15.1b/
./configure --prefix=$TARGET_DIR
#error: unrecognized command line option "-fforce-mem"
#解决方法：找到libmad-0.15.1b配置之后的Makefile，将里面出现的-fforce-mem字符串全部删掉，再重新编译之后就OK了。
sed -i -e 's|\-fforce\-mem|\ |' Makefile
make
make install
cd ../../

cd $SRC_DIR/madplay-0.15.2b/
./configure --prefix=$TARGET_DIR CPPFLAGS=-I$TARGET_DIR/include LDFLAGS=-L$TARGET_DIR/lib
make
make install
cd ../../