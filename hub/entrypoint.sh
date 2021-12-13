#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/

cp -vT /data/servers/plugins/Hub.jar /home/container/data/plugins/
cp -RvT /data/servers/configs/hub/ /home/container/data/
cp -RvT /data/servers/plugins/core/ /home/container/data/plugins/


hostname > /home/container/data/hostname.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx3G --enable-preview -jar server.jar

