#!/bin/bash
wget -P $HOME/Downloads https://download.jetbrains.8686c.com/python/pycharm-professional-2018.1.1.tar.gz
cd $HOME/Downloads 
tar -xzvf pycharm-professional-2018.1.1.tar.gz -C /tmp
cd /tmp/pycharm-2018.1.1
./pycharm.sh
