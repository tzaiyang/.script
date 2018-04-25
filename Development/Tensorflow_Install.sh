#!/bin/bash 
set -e

PYTHON_VERSION="2.7" # 2.7/3.n
Virtualenv_TargetDir="$HOME/ML/tensorflow/python2" #"~/ML/tensorflow/python3"
INSTALL_METHOD="Virtualenv" #Virtualenv/NativePip
INSTALL_COMMAND="install" #install/uninstall
INSTALL_TARGET="CPU" # CPU/GPU


function InstallTensorflow {
    echo Install Tensorflow
    case $INSTALL_TARGET in
    "CPU")
      echo CPU ONLY
      if [ $PYTHON_VERSION = 2.7 ];then     
      sudo -H pip install tensorflow      # for Python 2.7
      elif [ $PYTHON_VERSION = 3.n ];then 
      sudo -H pip3 install --upgrade tensorflow     # for Python 3.n
      fi
      ;;
    "GPU")     
      echo GPU
      if [ $PYTHON_VERSION = 2.7 ];then     
      sudo -H pip install --upgrade tensorflow-gpu  # for Python 2.7 and GPU
      elif [ $PYTHON_VERSION = 3.n ];then 
      sudo -H pip3 install --upgrade tensorflow-gpu # for Python 3.n and GPU
      fi
      echo NVIDIA requirements to run TensorFlow with GPU support...
      echo NVIDIA GPU Driver and Cuda
      ;;
    esac
}

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

function UninstallTensorflow {
  echo Uninstall Tensorflow
  if [ $INSTALL_METHOD = Virtualenv ];then
    sudo rm -r $Virtualenv_TargetDir
  elif [ $INSTALL_METHOD = NativePip ];then 
    if [ $PYTHON_VERSION = 2.7 ];then 
    sudo pip uninstall tensorflow  # for Python 2.7
    elif [ $PYTHON_VERSION = 3.n ];then 
    sudo pip3 uninstall tensorflow # for Python 3.n
    fi
  fi
}

# cuDNN install
# https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html
function CuDNN_Install {
   # login with AIWAC2018@163.com/Epic2018
   wget -P $HOME/Downloads/ https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.1.3/prod/9.1_20180414/cudnn-9.1-linux-x64-v7.1
   cd $HOME/Downloads
   tar -xzvf cudnn-9.1-linux-x64-v7.1.tgz
   sudo cp cuda/include/cudnn.h /usr/local/cuda/include
   sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
   sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
   
   # To verify that cuDNN is installed and is running properly, compile the mnistCUDNN sample located in the /usr/src/cudnn_samples_v7 directory in the debian file.
   # Copy the cuDNN sample to a writable path.
   cp -r /usr/src/cudnn_samples_v7/ $HOME
   # Go to the writable path.
   cd  $HOME/cudnn_samples_v7/mnistCUDNN
   # Compile the mnistCUDNN sample.
   # make clean && make
   # Run the mnistCUDNN sample.
   ./mnistCUDNN
   # If cuDNN is properly installed and running on your Linux system, you will see a message similar to the following:
   # Test passed!
}

# Cuda9.1
# NVIDIA graphics driver R375 or newer for CUDA 8
# NVIDIA graphics driver R384 or newer for CUDA 9
# NVIDIA graphics driver R390 or newer for CUDA 9.1
# Before installing the CUDA Toolkit on Linux, please ensure that you have the latest NVIDIA driver R390 installed. The latest NVIDIA R390 driver is available at: www.nvidia.com/drivers
# Refrence:https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=debnetwork
function Cuda_Install {
   #sudo wget -P Downloads/ http://developer.download.nvidia.com/compute/cuda/9.1/secure/Prod/local_installers/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64.deb?0aOxKWselF-nL5tViJec2jToKbP1Lym9bgh4okOOWS7TzNsRQEqX3nNHj-smUb5xRHpC7gICF5J40b5axkxgFUI8XmeJLcd0naexgIJiIIWvctRr881mi8SzOIuD2LFSq8HD0DqvSvtFW2VsxY0ET7_502HS68YAfL3vlGtz0N1_ePA70ZJvbZpqFmeY__Zvzkqd40XAssTEEWPIHeE
   sudo wget -P $HOME/Downloads/ http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
   cd $HOME/Downloads
  #  sudo dpkg -i cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64.deb
  #  sudo apt-key add /var/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64/7fa2af80.pub
   sudo dpkg -i cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
   sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
   sudo apt-get update
   sudo apt-get install cuda
   cd $HOME/.script
}

function main {
  python -V
  pip -V
  if [ $INSTALL_COMMAND = install ];then 
    InstallPython
    if [ $INSTALL_METHOD = Virtualenv ];then
    echo Installing with Virtualenv
    VirtualenvInstall 
    elif [ $INSTALL_METHOD = NativePip ];then  
    echo Installing with Native pip
    fi
    InstallTensorflow
  elif [ $INSTALL_COMMAND = uninstall ];then  ### Uninstalling TensorFlow
  UninstallTensorflow
  fi
}

main