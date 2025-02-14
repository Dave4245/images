#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -v /home/data/hostname.txt /home/data/development_server.txt

mkdir /home/data/plugins
cp -rv /data/production/servers/plugins/core/* /home/data/plugins

hostname > /home/data/hostname.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx8G -Dlog4j2.formatMsgNoLookups=true --enable-preview -jar server.jar

