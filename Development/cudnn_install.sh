#!/bin/bash
#cuda_version=9.2  
cuda_version=10.0
cudnn_version=v7.6.1.34

cuda_path=/usr/local/cuda-$cuda_version
tar -xzvf "cudnn-"$cuda_version"-linux-x64-"$cudnn_version".tgz"
sudo cp cuda/include/cudnn.h $cuda_path/include/
sudo cp cuda/lib64/libcudnn* $cuda_path/lib64/ -d
sudo chmod a+r $cuda_path/include/cudnn.h
sudo chmod a+r $cuda_path/lib64/libcudnn*

# view cuda version installed 
cat /usr/local/cuda/version.txt 
# view cudnn version installed
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
