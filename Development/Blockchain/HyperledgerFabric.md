### [docker-ce Install](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)  
```bash
# only for linux client  
curl -fsSL https://get.docker.com -o get-docker.sh | sudo sh 
sudo usermod -aG docker $USER

# uninstall 
sudo apt-get purge docker-ce
sudo rm -rf /var/lib/docker
```
### [docker images speed up](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)
```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://xk6zslu9.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```
### [docker-compose install](https://docs.docker.com/compose/install/) 
```bash
# install from github
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# install by apt
sudo apt-get install docker-compose  
```
### [golang install](https://golang.google.cn/doc/install) 
```bash
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz  
sudo tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz  
echo 'export PATH=$PATH:/usr/local/go/bin' >> .bashrc
source .bashrc  
```

### Install Samples, Binaries and Docker Images
```bash
git clone https://github.com/hyperledger/fabric.git  
cd fabric/scripts  
# no download binaries (linux)
sed -i 's/ curl/#curl/g' bootstrap.sh  
# no download binaries (macOSX)
sed -i '' 's/ curl/#curl/g' bootstrap.sh  
./bootstrap.sh  
```