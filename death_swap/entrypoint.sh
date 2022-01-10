#!/bin/bash

java -version

LOCATION=""
IS_DEVELOPMENT_SERVER=""

if test -z "$DEVELOPMENT_SERVER"; then
  LOCATION="production"
  IS_DEVELOPMENT_SERVER="false"
else
  LOCATION="development"
  IS_DEVELOPMENT_SERVER="true"
fi

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/data/
mkdir -pv /home/data/plugins/

cp -rv /data/$LOCATION/servers/plugins/DeathSwap.jar /home/data/plugins
cp -rv /data/$LOCATION/servers/configs/minigame/* /home/data
cp -rv /data/$LOCATION/servers/plugins/core/* /home/data/plugins

hostname > /home/data/hostname.txt
echo "${IS_DEVELOPMENT_SERVER}" > /home/data/development_server.txt

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx6G --enable-preview -jar server.jar

