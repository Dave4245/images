#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/
mkdir -pv /home/container/data/plugins/

cp -RpvT /data/servers/plugins/bungee/ /home/container/data/plugins/
cp -RpvT /data/servers/configs/bungee/ /home/container/data/

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx1G --enable-preview -jar server.jar
