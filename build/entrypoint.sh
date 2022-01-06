#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -v /home/container/data/hostname.txt /home/container/data/development_server.txt

hostname > /home/container/data/hostname.txt
echo "false" > /home/container/data/development_server.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx8G --enable-preview -jar server.jar

