#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/
mkdir -pv /home/container/data/plugins/

cp -vpT /data/servers/plugins/DeathSwap.jar /home/container/data/plugins/
cp -RvpT /data/servers/configs/minigame/ /home/container/data/
cp -RvpT /data/servers/plugins/core/ /home/container/data/plugins/

hostname > /home/container/data/hostname.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx4G --enable-preview -jar server.jar

