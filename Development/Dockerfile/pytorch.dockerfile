ARG IMAGE_NAME=registry.cn-hangzhou.aliyuncs.com/mango9102/10.1-cudnn7-runtime-ubuntu16.04
FROM ${IMAGE_NAME}:latest
LABEL maintainer "mango9102<https://github.com/tzaiyang>"

ENV PYTORCH_VERSION 1.3.0
ENV VISION_VERSION 0.4.1
ENV PYTHON_VERSION 3.6

RUN apt-get update && apt-get install -y --no-install-recommends build-essential git curl ca-certificates libjpeg-dev libpng-dev \
&& \
    rm -rf /var/lib/apt/lists/*

RUN curl -v -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && chmod +x ~/miniconda.sh \
&& \
    ~/miniconda.sh -b -p /opt/conda && rm ~/miniconda.sh \
&& \
    /opt/conda/bin/conda install -y python=$PYTHON_VERSION conda-build pyyaml numpy ipython &&/opt/conda/bin/conda clean -ya

ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN conda install pytorch=$PYTORCH_VERSION torchvision=$VISION_VERSION -c pytorch

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
WORKDIR /workspace
RUN chmod -R a+w /workspace

