## Docker Comand
### To create the docker group and add your user:
### Create the docker group.
> sudo groupadd docker
### Add your user to the docker group.
> sudo usermod -aG docker $USER
### Log out and log back in so that your group membership is re-evaluated.

### Download ubuntu image
> docker search ubuntu  
> docker pull ubuntu  
> docker images  
### Download tensorflow image
### with CPU ONLY
> docker run -it tensorflow/tensorflow bash  
> docker run -it -p 8888:8888 tensorflow/tensorflow
### with NVIDIA GPU
> nvidia-docker run -it tensorflow/tensorflow:latest-gpu bash  
> nvidia-docker run -it -p 8888:8888 tensorflow/tensorflow:latest-gpu 


### Create python3-tensorflow from tensorflow/tensorflow:latest-gpu image
> nvidia-docker run -ti -v /home/tzaiyang:/home/tzaiyang --name tf-py3 tensorflow:gpu-py3 bash
### Run the python3-tensorflow
> nvidia-docker exec -ti tf-py3 bash

### Commit your image from changed container
> nvidia-docker commit python3-tensorflow tensorflow:gpu-python3  
> docker ps -a
