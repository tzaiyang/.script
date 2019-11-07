#!/bin/bash 

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

# 2019-11-07 revision
#Perform the pre-installation actions.
#Install repository meta-data
#sudo dpkg -i cuda-repo-<distro>_<version>_<architecture>.deb
#Installing the CUDA public GPG key
#When installing using the local repo:
#
#sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
#When installing using network repo on Ubuntu 18.04/18.10:
#
#$ sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/<distro>/<architecture>/7fa2af80.pub
#When installing using network repo on Ubuntu 16.04:
#
#sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/<distro>/<architecture>/7fa2af80.pub
#Update the Apt repository cache
sudo apt-get update
#Install CUDA
sudo apt-get install cuda
#Perform the post-installation actions.
