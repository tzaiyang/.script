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