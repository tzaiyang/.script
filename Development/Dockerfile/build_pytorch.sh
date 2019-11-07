#!/bin/bash
DOCKER_IMAGE_NAME="registry.cn-hangzhou.aliyuncs.com/mango9102/pytorch"
PYTORCH_VERSION=1.3.0
#systemctl start docker
docker build -t ${DOCKER_IMAGE_NAME}:${PYTORCH_VERSION} -f pytorch.dockerfile .
#docker images
#nvidia-docker run -it ${DOCKER_IMAGE_NAME}
