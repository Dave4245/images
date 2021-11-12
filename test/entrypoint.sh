#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

sleep 5

rm -rv /home/container/data/
cp -rvT /data/ /home/container/data/
hostname > /home/container/data/server-name.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
eval "java -Xms128M -Xmx5G --enable-preview -jar server.jar"
