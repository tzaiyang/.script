#!/bin/bash
function Docker_Install {
  echo Installing Docker
  sudo apt-get update 
  sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
  sudo apt-get update
  sudo apt-get inshttps://github.com/tall docker-ce
  sudo docker run hello-world
}

function Add_Docker_UserGroup {
    echo Add Docker User group 
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

function NVIDIA-DOCKER_INSTALL {
  echo Installing NVIDIA docker2
  # Add the package repositories
  curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
  distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
  curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
  sudo apt-get update

  # Install nvidia-docker2 and reload the Docker daemon configuration
  sudo apt-get install -y nvidia-docker2
  sudo pkill -SIGHUP dockerd

  # Test nvidia-smi with the latest official CUDA image
  docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
}

function Add_Tensorflow_Image {
  echo Add tensorflow lastest gpu image
  nvidia-docker run -it -p 8888:8888 tensorflow/tensorflow:latest-gpu
}

function Add_Caffe_Image {
  sudo docker run -ti bvlc/caffe:cpu caffe --version
}

function main {
  Docker_Install
  Add_Caffe_Image
  #sudo docker run -ti --name caffe_cpu bvlc/caffe:cpu bash
}

main



