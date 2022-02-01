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

cp -rv /data/$LOCATION/servers/plugins/Minigame.jar /home/data/plugins
cp -rv /data/$LOCATION/servers/configs/minigame/* /home/data
cp -rv /data/$LOCATION/servers/plugins/core/* /home/data/plugins

hostname > /home/data/hostname.txt
echo "${DEVELOPMENT_SERVER}" > /home/data/development_server.txt

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx6G -Dlog4j2.formatMsgNoLookups=true --enable-preview -jar server.jar

