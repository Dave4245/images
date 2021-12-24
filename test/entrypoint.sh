#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/
mkdir -pv /home/container/data/plugins/

cp -rv /data/servers/plugins/Hub.jar /home/container/data/plugins
cp -rv /data/servers/configs/hub/* /home/container/data
cp -rv /data/servers/plugins/core/* /home/container/data/plugins

hostname > /home/container/data/hostname.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

echo "${TEST_SERVER}" > /home/container/data/test_server.txt

cd /home/container/data || exit
exec java -Xms128M -Xmx3G --enable-preview -jar server.jar
