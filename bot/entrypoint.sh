#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/
cp -rvT /data/ /home/container/data/

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
eval "java -Xms128M -Xmx1G --enable-preview -jar Bot.jar"
