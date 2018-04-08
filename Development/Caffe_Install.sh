#!/bin/bash
#caffe was installed on ubuntu16.04
#Dec.4th.2017
#set -e

UBUNTU_VERSION=1604
PYTHON_VERSION="3.n" # 2.7/3.n
Virtualenv_TargetDir="$HOME/ML/caffe/python3" #"$HOME/ML/caffe/python3"
INSTALL_METHOD="Virtualenv" #Virtualenv/NativePip
INSTALL_COMMAND="install" #install/uninstall
INSTALL_TARGET="CPU" # CPU/GPU

function InstallPython {
  if [ $PYTHON_VERSION = 2.7 ];then 
  echo Installing python 2.7
  sudo apt-get install python-pip python-dev   # for Python 2.7

  elif [ $PYTHON_VERSION = 3.n ];then
  echo Installing python 3.n
  sudo apt-get install python3-pip python3-dev # for Python 3.n
  fi
}

function VirtualenvInstall {
  sudo apt-get install  python-virtualenv
  sudo mkdir -p $Virtualenv_TargetDir
  if [ $PYTHON_VERSION = 2.7 ];then 
    sudo virtualenv --system-site-packages $Virtualenv_TargetDir # for Python 2.7
  elif [ $PYTHON_VERSION = 3.n ];then 
    sudo virtualenv --system-site-packages -p python3 $Virtualenv_TargetDir # for Python 3.n
  fi

  source $Virtualenv_TargetDir/bin/activate # bash, sh, ksh, or zsh
}

function InstallPreCompiledCaffe {
    echo Installing Precompiled caffe
    if [ $INSTALL_TARGET = "CPU" ];then 
    sudo apt install caffe-cpu
    elif [ $INSTALL_TARGET = "GPU" ];then 
    sudo apt install caffe-cuda
    # need to install NVIDIA driver and CUDA toolkit
    echo need to install NVIDIA driver and CUDA toolkit
    fi
}

function DowloadCaffeSource {
    cd $HOME
    sudo apt-get install git
    git clone https://github.com/BVLC/caffe.git
}

function InstallDependencies {
    echo Install Dependencies
    if [ $UBUNTU_VERSION -ge 1704 ];then
        sudo apt build-dep caffe-cpu        # dependencies for CPU-only version
        sudo apt build-dep caffe-cuda       # dependencies for CUDA version
    else 
        # General dependencies
        sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
        sudo apt-get install --no-install-recommends libboost-all-dev    
        if [ $UBUNTU_VERSION -ge 1604 ];then 
            echo CUDA 8 is required on Ubuntu 16.04.
        elif [ $UBUNTU_VERSION -ge 1404 ];then 
            #Everything is packaged in 14.04.
            sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
        elif [ $UBUNTU_VERSION -ge 1204 ];then 
            #These dependencies need manual installation in 12.04.
            # glog
            mkdir -p /tmp/work
            cd /tmp/work
            wget https://github.com/google/glog/archive/v0.3.3.tar.gz
            tar zxvf v0.3.3.tar.gz
            cd glog-0.3.3
            ./configure
            make && make install
            # gflags
            cd /tmp/work
            wget https://github.com/schuhschuh/gflags/archive/master.zip
            unzip master.zip
            cd gflags-master
            mkdir build && cd build
            export CXXFLAGS="-fPIC" && cmake .. && make VERBOSE=1
            make && make install
            # lmdb
            cd /tmp/work
            git clone https://github.com/LMDB/lmdb
            cd lmdb/libraries/liblmdb
            make && make install
        fi
    
    fi 
}

function PythonRequires {
    echo Python requirements
    cd $HOME/caffe/python
    if [ $PYTHON_VERSION = 2.7 ];then 
    for req in $(cat requirements.txt); do pip install $req; done  # for Python 2.7
    elif [ $PYTHON_VERSION = 3.n ];then 
    for req in $(cat requirements.txt); do pip3 install $req; done  # for Python 3.n
    fi
}

function InstallBLAS {
    echo Install BLAS
    sudo apt-get install libatlas-base-dev  
    #or install OpenBLAS by sudo apt-get install libopenblas-dev #Set BLAS := open in Makefile.config
}

function CompileCaffe {
    echo Compilation with Make 

    cd $HOME/caffe
    #Configure the build by copying and modifying the example Makefile.config for your setup. The defaults should work, but uncomment the relevant lines if using Anaconda Python.
    cp Makefile.config.example Makefile.config
    #Adjust Makefile.config (for example, if using Anaconda Python, or if cuDNN is desired)
    make clean
    make pycaffe #python requires
    make matcaffe #matlab requires
    make all -j8
    make test -j8
    make runtest -j8
    #1.For CPU & GPU accelerated Caffe, no changes are needed.
    #2.For cuDNN acceleration using NVIDIA’s proprietary cuDNN software, uncomment the USE_CUDNN := 1 switch in Makefile.config. cuDNN is sometimes but not always faster than Caffe’s GPU acceleration.
    #3.For CPU-only Caffe, uncomment CPU_ONLY := 1 in Makefile.config.
    #To compile the Python and MATLAB wrappers do make pycaffe and make matcaffe respectively. Be sure to set your MATLAB and Python paths in Makefile.config first!

    #-两个路径要改成这样:(添加后面的两个hdf5的路径, 否则编译时报hdf5错误)
    # Whatever else you find you need goes here.
    #INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial
    #LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu/hdf5/serial
}

function InstallCuda {
    #install cuDNN then uncomment the USE_CUDNN := 1 flag in Makefile.config when installing Caffe
    echo install NVIDA CUDA
}

function ImportCaffePythonModule {
    echo To import the caffe Python module after completing the installation
    cd $HOME
    echo "export PYTHONPATH=\$HOME/caffe/python:\$PYTHONPATH" >> .bashrc
    source .bashrc
}

function InstallEtraPython {
    sudo apt-get install python-sklearn 
    sudo apt-get install python-skimage
    sudo apt-get install python-protobuf
}

function main {
  python -V
  pip -V
  if [ $INSTALL_COMMAND = install ];then
    echo install python
    InstallPython
    if [ $INSTALL_METHOD = Virtualenv ];then
    echo Installing with Virtualenv
    VirtualenvInstall 
    elif [ $INSTALL_METHOD = NativePip ];then  
    echo Installing with Native pip
    fi
    
    InstallDependencies

    if [ $UBUNTU_VERSION -ge 1704 ];then
        InstallPreCompiledCaffe
    else
        echo Installing Caffe from source
        InstallCuda
        InstallBLAS
        DowloadCaffeSource
        PythonRequires
        CompileCaffe
    fi

  elif [ $INSTALL_COMMAND = uninstall ];then  ### Uninstalling TensorFlow
  sudo mv $Virtualenv_TargetDir /tmp/
  fi
}

main