#!/bin/bash
# Refrence:https://zhuanlan.zhihu.com/p/25710517
Container_Name="template"
function Check_GPU_Driver {
    ls -l /dev/nvidia*
    nvidia-smi
}
function Mount_NAS {
    #optional
    echo Mount NAS 
    echo "/mnt/NAS/Share /NAS/Share nfs rw 0 0" >> /etc/fstab
}
function NOPASSWD_For_sudo {
    sudo visudo
    #%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
}
function Install_LXC {
    sudo apt-get install lxc
    # root 
    echo "ubuntu veth lxcbr0 10" >> /etc/lxc/lxc-usernet

    sudo mkdir -p $HOME/.config/lxc
    sudo cp  /etc/lxc/default.conf $HOME/.config/lxc/default.conf
    # root
    sudo echo "lxc.id_map = u 0 100000 65536" >> $HOME/.config/lxc/default.conf
    sudo echo "lxc.id_map = g 0 100000 65536" >> $HOME/.config/lxc/default.conf

    sudo echo "lxc.mount.entry = /dev/nvidia0        dev/nvidia0        none bind,optional,create=file" >> $HOME/.config/lxc/default.conf
    sudo echo "lxc.mount.entry = /dev/nvidia1        dev/nvidia1        none bind,optional,create=file" >> $HOME/.config/lxc/default.conf
    sudo echo "lxc.mount.entry = /dev/nvidiactl      dev/nvidiactl      none bind,optional,create=file" >> $HOME/.config/lxc/default.conf
    sudo echo "lxc.mount.entry = /dev/nvidia-modeset dev/nvidia-modeset none bind,optional,create=file" >> $HOME/.config/lxc/default.conf
    sudo echo "lxc.mount.entry = /dev/nvidia-uvm     dev/nvidia-uvm     none bind,optional,create=file" >> $HOME/.config/lxc/default.conf
}

function Create_Container {
    sudo lxc-create -t download -n $Container_Name -- --server mirrors.tuna.tsinghua.edu.cn/lxc-images
    #lxc-create -t download -n $Container_Name

    # Distribution: ubuntu
    # Release: xenial
    # Architecture: amd64
    
    # Mount GPU And NAS
    # root

    #echo "lxc.mount.entry = /NAS/Share          NAS/Share          none bind,         create=dir"  >> /etc/lxc/default.conf

    echo "lxc.mount.entry = /dev/nvidia0        dev/nvidia0        none bind,optional,create=file" >> $HOME/.local/share/lxc/template/config
    echo "lxc.mount.entry = /dev/nvidia1        dev/nvidia1        none bind,optional,create=file" >> $HOME/.local/share/lxc/template/config
    echo "lxc.mount.entry = /dev/nvidiactl      dev/nvidiactl      none bind,optional,create=file" >> $HOME/.local/share/lxc/template/config
    echo "lxc.mount.entry = /dev/nvidia-modeset dev/nvidia-modeset none bind,optional,create=file" >> $HOME/.local/share/lxc/template/config
    echo "lxc.mount.entry = /dev/nvidia-uvm     dev/nvidia-uvm     none bind,optional,create=file" >> $HOME/.local/share/lxc/template/config
    #echo "lxc.mount.entry = /NAS/Share          NAS/Share          none bind,         create=dir"  >> $HOME/.local/share/lxc/template/config
}
function Start_Container {
    sudo lxc-start -n $Container_Name -d
}
function Attach_Container {
    echo And get a shell inside it with:
    sudo lxc-attach -n $Container_Name
}
function Status_Container {
    echo You can then confirm its status with either of:
    sudo lxc-info -n $Container_Name
    sudo lxc-ls -f
}
function Stop_Container {
    echo Stopping it can be done with:
    sudo lxc-stop -n $Container_Name
}
function Remove_Container {
    echo And finally removing it with:
    sudo lxc-destroy -n $Container_Name
}
function Container_Install_Nvidia_Driver {
    apt update && apt install -y openssh-server
    wget http://us.download.nvidia.com/XFree86/Linux-x86_64/381.22/NVIDIA-Linux-x86_64-381.22.run
    bash NVIDIA-Linux-x86_64-381.22.run --no-kernel-module
    nvidia-smi
    exit
}

function main {
    Check_GPU_Driver
    NOPASSWD_For_sudo
    Install_LXC
    Create_Container
    Start_Container
    Attach_Container
    Container_Install_Nvidia_Driver
    Stop_Container

    sudo mkdir -p /root/lxc-public-images/
    sudo cp -r $HOME/.local/share/lxc/template/config /root/lxc-public-images/template
    # sudo vim /root/lxc-public-images/template/config
    # delete: lxc.network.hwaddr, lxc.id_map, lxc.rootfs, lxc.utsname
}



# wget http://developer.download.nvidia.com/compute/cuda/9.1/secure/Prod/local_installers/cuda_9.1.85_387.26_linux.run?L9bdiW7E_iV5edqQE_soJb8odFYdSuFufxVpavakMKmHuSXivIFfdXWPXwxO08711gKO3jSWBLbq45_fpm0CaFT1ybWCpTz_t00AQBIhrUpYtk4bDCLhdxj9xGM7xPgziHstinaVVA_yyAP9-xz_lVs7Ls6_FRA9a1p3LAWEM9Pxs1Vt_r6IrYU