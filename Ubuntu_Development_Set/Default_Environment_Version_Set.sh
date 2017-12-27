#Ubuntu16.04

#python version set
#将python2.7切换成python3.5
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
python -V
#如果要切回到python2.7
#sudo update-alternatives --config python

#Nano To Vim
#solution 1:
sudo update-alternatives --config editor
#choose forth vim.basic option
#solution 2:
#echo export EDITOR=/usr/bin/vim >> ~/.bashrc
#source ~/.bashrc

#修改默认java版本
sudo update-alternatives --config java 

