#!/bin/bash
#opencv2.4.13 was installed on ubuntu16.04 for python3.5
#Dec.27th.2017

#Preparation
git clone https://github.com/opencv/opencv.git $HOME/opencv
#或从官网下载对应版本源码

cd $HOME/opencv
mkdir build
cd build

sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

#cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local PYTHON3_EXECUTABLE = /usr/bin/python3 PYTHON_INCLUDE_DIR = /usr/include/python3.5 PYTHON_INCLUDE_DIR2 = /usr/include/x86_64-linux-gnu/python3.5m PYTHON_LIBRARY = /usr/lib/x86_64-linux-gnu-python3/libpython3.5m.so PYTHON3_NUMPY_INCLUDE_DIRS = /usr/local/lib/python3.5/dist-packages/numpy/core/include/ ..

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

make -j4
sudo make install


#http://blog.topspeedsnail.com/archives/4755
#本帖记录在Ubuntu 16.04上安装OpenCV的步骤，并分别安装Python 2和Python 3的绑定。
