# Creating tensorflow enviorment with python3
FROM ubuntu

MAINTAINER henrry

# install python3 and pip3
RUN apt update \
        && apt install -y python3-pip python3-dev vim \
        && pip3 install --upgrade pip \
        && pip3 install tensorflow \
        && pip3 install tensorflow-gpu \
        && ln -s /usr/bin/python3 /usr/bin/python \
        && ln -s /usr/bin/pip3 /usr/bin/pip \
	&& pip3 install jupyter notebook

# map port
EXPOSE 8888

# add files
ADD vimrc /root/.vimrc
