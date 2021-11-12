#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

sleep 5

ls /home/container
rm -rv /home/container/
cp -rv /data/. /home/container
hostname > /home/container/server-name.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container || exit
eval "java -Xms128M -Xmx5G --enable-preview -jar server.jar"
