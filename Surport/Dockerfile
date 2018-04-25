# Creating tensorflow enviorment with python3
FROM ubuntu

MAINTAINER tzaiyang

# install python3 and pip3
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt-get update&&apt-get install -y --assume-yes apt-utils python3-pip python3-dev vim
RUN pip3 install --upgrade pip
RUN pip3 install tensorflow==1.2.0
RUN pip3 install tensorflow-gpu==1.2.0
RUN pip3 install jupyter notebook

RUN pip3 install pandas
RUN pip3 install librosa
RUN pip3 install python_speech_features

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

# map port
EXPOSE 8888

# add files
#ADD vimrc /root/.vimrc

