#!/bin/bash
set -e
HOME_DIR=$PWD

wget -P /tmp http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader2.4.1.0609_Server_x64_enu_Setup.run.tar.gz
cd /tmp
gzip -d FoxitReader2.4.1.0609_Server_x64_enu_Setup.run.tar.gz
tar xvf FoxitReader2.4.1.0609_Server_x64_enu_Setup.run.tar
./FoxitReader.enu.setup.2.4.1.0609\(r08f07f8\).x64.run

cd HOME_DIR
