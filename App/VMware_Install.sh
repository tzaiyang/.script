#!/bin/bash
wget -P ~/Downloads https://dl-sh-ctc-2.pchome.net/08/b7/VMware-Workstation-Full-14.1.0-7370693.x86_64.bundle?key=78e16233109bb86bee8c3b5e7cf0d245&tmp=1519818952839
cd ~/Downloads
sudo chmod 777 VMware-Workstation-Full-14.1.0-7370693.x86_64.bundle
sudo ./VMware-Workstation-Full-14.1.0-7370693.x86_64.bundle

#vmware14 key:CG54H-D8D0H-H8DHY-C6X7X-N2KG6
#vmware12 key:5A02H-AU243-TZJ49-GTC7K-3C61N

#uninstall:
# vmware-installer --list-products /vmware-installer -l
# sudo vmware-installer -u vmware-workstation
