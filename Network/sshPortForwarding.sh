#!/bin/bash
# add to startup（autorun)
# setsid sshPortForwarding.sh(nohup sshPortForwarding.sh&) #daemon running
# target host(private ip)
serverUser=admin
serverIP=yourip
ForwardingPort=7002
rsa=/home/username/.ssh/id_rsa
exit=1

# ssh-copy-id -i /home/username/.ssh/id_rsa.pub ${serverUser}@${serverIP}

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

############## add rc.local######################

#!/bin/bash -e 

# #log
# exec 2> /tmp/rc.local.log
# exec 1>&2 
# set -x 

# xxx/sshPortForwarding.sh

# exit 0


