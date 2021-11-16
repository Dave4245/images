#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/
cp -rv /data/. /home/container/data/
hostname > /home/container/data/server-name.txt
ls
echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec "java -Xms128M -Xmx1G --enable-preview -jar server.jar"
