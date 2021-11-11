#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cp -rv /data/. /home/container
hostname > /home/container/server-name.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container || exit
eval "java -Xms128M -Xmx5G --enable-preview -jar server.jar"
