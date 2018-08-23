#!/bin/bash

wget -P ~/Downloads https://dl.google.com/dl/android/studio/ide-zips/3.1.2.0/android-studio-ide-173.4720617-linux.zip 
cd ~/Downloads
unzip android-studio-ide-173.4720617-linux.zip
mv android-studio /opt/
cp Surport/android_studio.desktop /usr/share/applications/

