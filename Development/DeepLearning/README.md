Deep Learning Development
===

Hardware
---
GPU  
- NVIDIA® 1080Ti  
- NVIDIA® DGX-1™           
  DGX-1服务器采用了8个Tesla V100 32 GB GPU和双槽Xeon E5 2698v4处理器。服务器通过四个EDR IB / GbE端口连接。
- NVIDIA® DGX-2™  
  DGX-2在单一系统中包含了16个NVIDIA Tesla™ V100 32 GB GPU和其他顶级组件（两个24核Xeon CPU、1.5 TB DDR4 DRAM内存和30 TB NVMe存储），通过基于NVSwitch的NVLink结构连接，可提供2 petaFLOPS的性能，堪称最强大的超级计算机之一。

TPU: 张量处理单元（TPU）是一种定制化的 ASIC 芯片，它由谷歌从头设计，并专门用于机器学习工作负载。Cloud TPU 将 TPU 作为可扩展的云计算资源，并为所有在 Google Cloud 上运行尖端 ML 模型的开发者与数据科学家提供计算资源。

NPU: Neural-network Processing Unit,神经网络处理器，在电路层模拟人类神经元和突触，并且用深度学习指令集直接处理大规模的神经元和突触，一条指令完成一组神经元的处理。相比于CPU中采取的存储与计算相分离的冯诺伊曼结构，NPU通过突触权重实现存储和计算一体化，从而大大提高了运行效率。NPU的典型代表有国内的寒武纪芯片和IBM的TrueNorth，中星微电子的“星光智能一号”虽说对外号称是NPU，但其实只是DSP，仅支持网络正向运算，无法支持神经网络训练。而且从存储结构上看，该款芯片是基于传统的片上存储，而非神经网络芯片的便携式存储。 

Software  
---
GPU Driver  

CUDA:CUDA是NVIDIA推出的用于自家GPU的并行计算框架，也就是说CUDA只能在NVIDIA的GPU上运行。 

cuDNN:cuDNN是一个SDK，是一个专门用于神经网络的加速包。

Eigen::Tensor，是一个高层次的C ++库，有效支持线性代数，矩阵和矢量运算，数值分析及其相关的算法
 
- *NVIDIA Docker + CUDA Toolkit Install(GPU Driver+CUDA)*  
The CUDA Toolkit contains the CUDA driver and tools needed to create, build and run a CUDA application as well as libraries, header files, CUDA samples source code, and other resources.   
    1. [CUDA Package Manager Installation](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu-installation)/[Download the NVIDIA CUDA Toolkit](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#download-nvidia-driver-and-cuda-software)   
    ```bash
    bash Development/DeepLearning/cuda_toolkit.sh 
    ```
    2. [docker-ce Install](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)/[nvidia-container-toolkit install](https://github.com/NVIDIA/nvidia-docker?spm=5176.8351553.0.0.b6dd1991GQsKrp#ubuntu-16041804-debian-jessiestretchbuster)   
    ```bash
    bash Development/DeepLearning/docker.sh
    ```
    1. [base images](https://hub.docker.com/r/nvidia/cuda)/[dockerfiles](https://gitlab.com/nvidia/container-images/cuda/tree/master/dist)

- *Pytorch Install*
1. https://pytorch.org/
- FAQ  
    *Docker启动Get Permission Denied*
>Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/json: dial unix /var/run/docker.sock: connect: permission denied

>docker守护进程启动的时候，会默认赋予名字为docker的用户组读写Unix socket的权限，因此只要创建docker用户组，并将当前用户加入到docker用户组中，那么当前用户就有权限访问Unix socket了，进而也就可以执行docker相关命令

```bash
sudo groupadd docker     #添加docker用户组
sudo gpasswd -a $USER docker     #将登陆用户加入到docker用户组中
newgrp docker     #更新用户组
docker ps    #测试docker命令是否可以使用sudo正常使用
```

#### Tensorflow
*XLA* (Accelerated Linear Algebra) is a domain-specific compiler for linear algebra that optimizes TensorFlow computations.
- AOT(Ahead of time)
- JIT(Just-in-time)

*SWIG* (Simplified Wrapper and Interface Generator),SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages. http://www.swig.org

*Bazel* is an open-source build and test tool similar to Make, Maven, and Gradle. It uses a human-readable, high-level build language. Bazel supports projects in multiple languages and builds outputs for multiple platforms. Bazel supports large codebases across multiple repositories, and large numbers of users. 

*Protobuf*,Protocol Buffers (a.k.a., protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data.

#### Pytorch  


### API 
##### Tensorflow API
sparse_softmax_cross_entropy_with_logits(_sentinel=None, labels=None, logits=None, name=None)

softmax_cross_entropy_with_logits(_sentinel=None, labels=None, logits=None, name=None)  
两个函数用法相似：唯一的区别是sparse的labels是int类型，而非sparse的labels是one-hot类型。

