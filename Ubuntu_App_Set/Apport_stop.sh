#!/bin/bash
#stop apport service:"Sorry,ubuntu xx.xx has experienced an internal error."
#sudo service apport stop
sudo sed -i -e 's|enabled\=1|enabled\=0|' /etc/default/apport 
sudo service apport restart 

#start apport service:
#sudo service apport start
#sudo sed -i -e 's|enabled\=0|enabled\=1|' /etc/default/apport
#sudo service apport restart