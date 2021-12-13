#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/

cp -pvT /data/servers/plugins/Manhunt.jar /home/container/data/plugins/
cp -RvpT /data/servers/configs/minigame/ /home/container/data/
cp -RvpT /data/servers/plugins/core/ /home/container/data/plugins/

hostname > /home/container/data/hostname.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx5G --enable-preview -jar server.jar

