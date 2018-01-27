#!/bin/sh 
tftp -g -l /usr/bin/madplay -r madplay 192.168.3.110 
tftp -g -l /usr/lib/libid3tag.so.0 -r libid3tag.so.0 192.168.3.110 
tftp -g -l /usr/lib/libid3tag.so.0.3.0 -r libid3tag.so.0.3.0 192.168.3.110 
tftp -g -l /usr/lib/libmad.so.0 -r libmad.so.0 192.168.3.110 
tftp -g -l /usr/lib/libmad.so.0.2.1 -r libmad.so.0.2.1 192.168.3.110 
chmod 777 /usr/bin/madplay
