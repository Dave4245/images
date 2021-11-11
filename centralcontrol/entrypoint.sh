#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cd /data || exit
cp -rv . /home/container

cd /home/container || exit

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

eval "java -Xms128M -Xmx1G --enable-preview -jar CentralControl.jar"
