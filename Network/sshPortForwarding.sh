#!/bin/bash
# target host(private ip)
serverUser = root
serverIP = 1.1.1.1 
ForwardingPort = 7001
rsa = ~/.ssh/id_rsa
exit=1

while test $exit -eq 1
do
        if test $(ps | grep -c 'ssh.*-o StrictHostKeyChecking=no') -eq 1;then
            ssh -o StrictHostKeyChecking=no \  
            -o TCPKeepAlive=yes \  
            -o ServerAliveInterval=300 \  
            -o ServerAliveCountMax=2  \  
            -i $(rsa)  \  
            -C -f -N -R $(ForwardingPort):127.0.0.1:22 $(serverUser)@$(serverIP)
        fi
        sleep 60
done


# # local host
# ssh $(serverUser)@$(serverIP)

# # server host
# tragetUser = admin
# ssh -p $(ForwardingPort) $(tragetUser)@localhost


