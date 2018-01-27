#!/bin/sh
rm /bin/tinycap
rm *.wav
tftp -g -l /bin/tinycap -r tinycap 192.168.3.110
tftp -g -l /bin/tinyplay -r tinyplay 192.168.3.110
chmod 777 /bin/tinycap 
chmod 777 /bin/tinyplay

