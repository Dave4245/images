#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cd /data || exit
cp -rv . /home/container

cd /home/container || exit

hostname > /home/container/./server-name.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cat /home/container/./server-name.txt

eval "java -Xms128M -Xmx5G --enable-preview -jar server.jar"
