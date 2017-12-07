#!/bin/bash
#caffe was installed on ubuntu16.04
#Dec.4th.2017

#Preparation
#cd
#sudo apt-get install git
#git clone https://github.com/BVLC/caffe.git
#cd caffe
#cp Makefile.config.example Makefile.config
#Adjust Makefile.config (for example, if using Anaconda Python, or if cuDNN is desired)
#1.For CPU & GPU accelerated Caffe, no changes are needed.
#2.For cuDNN acceleration using NVIDIA’s proprietary cuDNN software, uncomment the USE_CUDNN := 1 switch in Makefile.config. cuDNN is sometimes but not always faster than Caffe’s GPU acceleration.
#3.For CPU-only Caffe, uncomment CPU_ONLY := 1 in Makefile.config.

#-两个路径要改成这样:(添加后面的两个hdf5的路径, 否则编译时报hdf5错误)
# Whatever else you find you need goes here.
#INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial
#LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu/hdf5/serial

#cd'
#execute this file!!!

#General dependencies
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev

#BLAS
sudo apt-get install libatlas-base-dev  #or install OpenBLAS by sudo apt-get install libopenblas-dev

#Python
sudo apt install python-pip
cd caffe/python
for req in $(cat requirements.txt); do pip install $req; done

#Compilation
#To compile the Python and MATLAB wrappers do make pycaffe and make matcaffe respectively. Be sure to set your MATLAB and Python paths in Makefile.config first!
#Speed
#for a faster build, compile in parallel by doing make all -j8 where 8 is the number of parallel threads for compilation (a good choice for the number of threads is the number of cores in your machine).
# cd ..
# make clean
# make pycaffe -j4
# make all -j4
# make test -j4
# make runtest -j4

#To import the caffe Python module after completing the installation
# cd
# echo "export PYTHONPATH=~/caffe/python:\$PYTHONPATH" >> .bashrc
# source .bashrc

#sudo apt-get install python-sklearn 
#sudo apt-get install python-skimage
#sudo apt-get install python-protobuf
