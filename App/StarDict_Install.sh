#!/bin/bash

function Download_Dict {
    echo Downloading dictionary
    # Website:http://download.huzheng.org/zh_CN/
    echo http://download.huzheng.org/zh_CN/
    . Surport/Default_Varible.sh
    #牛津现代英汉双解词典 推荐！
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-oxford-gb-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-oxford-gb-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
    #牛津高阶英汉双解
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-oald-cn-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-oald-cn-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
    #朗道英汉字典 推荐！
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-langdao-ec-gb-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
    #朗道汉英字典 推荐！
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-langdao-ce-gb-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-langdao-ce-gb-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
    #cedict-gb dictionary 推荐！
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-cedict-gb-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-cedict-gb-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
    #21世纪英汉汉英双向词典完整版
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-21cen-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-21cen-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
    #DrEye4in1词典 推荐！
    wget -P $DownloadAddress http://download.huzheng.org/zh_CN/stardict-DrEye4in1-2.4.2.tar.bz2
    sudo tar xjvf $DownloadAddress/stardict-DrEye4in1-2.4.2.tar.bz2 -C /usr/share/stardict/dic/

    sudo rm $DownloadAddress/stardict*
 }

 function main {
    echo installing stardict
    sudo apt-get install stardict
    Download_Dict
 }

 main