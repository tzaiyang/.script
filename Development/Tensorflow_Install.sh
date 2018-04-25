#!/bin/bash 
### Note version number compatibility###
### NVIDIA Driver 390
### Cuda 9.0
### Cudnn 7.05 for Cuda 9.0
### Tensorflow 1.7.0
### Note version number compatibility###

# Tensorflow Install Refrence:https://www.tensorflow.org/install/install_linux
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

# cuDNN install v7.05
# Install Refrence:https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html
function CuDNN_Install {
   # login with AIWAC2018@163.com/Epic2012
   wget -P $HOME/Downloads/ http://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.0.5/prod/9.0_20171129/cudnn-9.0-linux-x64-v7.tgz?xRBfZEkkotfHAS07dPztYSSM9RYackMq1LUBb6Myd35UbmtXY81lRZCf0CohUjwYLRBk62Y4QrlF5NsIVvQZIXxB961LTSv81KJUSNE4yPn58CzEoYu_btLeIdTThUJQGCpKnQcAIjSi9KH8hXHdf2loKGLG1HRkC89LBl4J288YLx7eLAHMeIQnFVP1O1_ZrB4suM2TkkE
   cd $HOME/Downloads
   tar -xzvf cudnn-9.0-linux-x64-v7.tgz
   sudo cp cuda/include/cudnn.h /usr/local/cuda/include
   sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
   sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

   # view the version
   cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
}

# Cuda9.0
# NVIDIA graphics driver R375 or newer for CUDA 8
# NVIDIA graphics driver R384 or newer for CUDA 9
# NVIDIA graphics driver R390 or newer for CUDA 9.1
# Before installing the CUDA Toolkit on Linux, please ensure that you have the latest NVIDIA driver R390 installed. The latest NVIDIA R390 driver is available at: www.nvidia.com/drivers
# Install Refrence:https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal
function Cuda_Install {
   sudo wget -P $HOME/Downloads http://developer.download.nvidia.com/compute/cuda/9.0/secure/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb?Ad1gg_9ofZ07K9IP569l-wOS3xeLrmVhjVpZMtNUFoPwfDaWfpTnii1qGbR7oxfFv9Ir-qVIOwkPZgvUVrNSxlVtSPJ4Dh2JeklLJFk2heiYHr-EKVOAqkxnNsqqJKwH-HxcTUhsmNJpSY-0koCtYTuSsfM8rFLzVTa_zF5o2L8A-jEwneWYsGpW_MjfqRdRY7NJODaLrxVv7B6qrjZ3
   sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
   sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
   sudo apt-get update
   sudo apt-get install cuda-libraries-9-0

   # view the version
   cat /usr/local/cuda/version.txt
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