#!/bin/bash

function main {
    # ./Oracle_JDK_Install.sh
    eclipse
    
}
function eclipse {
    # wget -P ~/Downloads http://ftp.jaist.ac.jp/pub/eclipse/oomph/epp/photon/R/eclipse-inst-linux64.tar.gz
    cd ~/Downloads 
    sudo tar zxvf eclipse-inst-linux64.tar.gz -C /opt

    sudo cp Surport/eclipse.desktop /usr/share/applications/
    sudo chmod u+x /usr/share/applications/eclipse.desktop

    /opt/eclipse-installer/eclipse-inst

}

main 