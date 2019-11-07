#!/bin/bash
DOCKER_IMAGE_NAME="registry.cn-hangzhou.aliyuncs.com/mango9102/10.1-cudnn7-runtime-ubuntu16.04"
#systemctl start docker
docker build -t ${DOCKER_IMAGE_NAME} -f 10.1-cudnn7-runtime-ubuntu16.04.dockerfile .
#docker images
#nvidia-docker run -it ${DOCKER_IMAGE_NAME}
