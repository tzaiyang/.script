#!/bin/bash
# New partion for a new disk 
sudo lshw -C disk
sudo fdisk /dev/sdb
# g, n , 1 ,w

sudo mkfs -t ext4 /dev/sdb1
sudo mkdir -p /mnt/newhome/
sudo mount -t ext4 -o rw /dev/sdb1 /mnt/newhome/
rsync -aXS --exclude='/*/.gvfs' /home/. /mnt/newhome/.
