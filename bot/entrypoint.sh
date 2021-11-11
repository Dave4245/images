#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cp -rv /data/. /home/container

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container || exit
eval "java -Xms128M -Xmx1G --enable-preview -jar Bot.jar"
