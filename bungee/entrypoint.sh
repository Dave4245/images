#!/bin/bash

java -version

LOCATION=""

if test -z "$DEVELOPMENT_SERVER"; then
  LOCATION="production"
else
  LOCATION="development"
fi

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/data/
mkdir -pv /home/data/plugins/

cp -rv /data/$LOCATION/servers/plugins/bungee/* /home/data/plugins
cp -rv /data/$LOCATION/servers/configs/bungee/* /home/data

hostname > /home/data/hostname.txt
echo "${DEVELOPMENT_SERVER}" > /home/data/development_server.txt

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx2G -Dlog4j2.formatMsgNoLookups=true --enable-preview -jar server.jar
