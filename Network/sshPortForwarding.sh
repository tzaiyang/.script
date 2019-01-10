#!/bin/bash
# add to startup（autorun)
# setsid sshPortForwarding.sh(nohup sshPortForwarding.sh&) #daemon running
# target host(private ip)
serverUser=admin
serverIP=yourip
ForwardingPort=7002
rsa=~/.ssh/id_rsa
exit=1

while test $exit -eq 1
do
if test $(ps -ef| grep -c 'StrictHostKeyChecking=no') -lt 2; then  
        ssh -o StrictHostKeyChecking=no \
            -o TCPKeepAlive=yes \
            -o ServerAliveInterval=300 \
            -o ServerAliveCountMax=2  \
            -i ${rsa}  \
            -C -f -N -R ${ForwardingPort}:127.0.0.1:22 ${serverUser}@${serverIP}
fi
sleep 60s
done


# # local host
# ssh $(serverUser)@$(serverIP)

# # server host
# tragetUser = admin
# ssh -p $(ForwardingPort) $(tragetUser)@localhost


