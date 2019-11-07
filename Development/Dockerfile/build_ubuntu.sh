#!/bin/bash
IMAGE_NAME="ubuntu"
VERSION="xenial"
#systemctl start docker
docker build -t ${IMAGE_NAME}:${VERSION} -f ubuntu.dockerfile .
#docker images
#nvidia-docker run -it ${DOCKER_IMAGE_NAME}
