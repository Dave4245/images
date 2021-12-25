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

rm -rv /home/container/data/
mkdir -pv /home/container/data/plugins/

cp -rv /data/$LOCATION/servers/plugins/MinecraftBut.jar /home/container/data/plugins
cp -rv /data/$LOCATION/servers/configs/minigame/* /home/container/data
cp -rv /data/$LOCATION/servers/plugins/core/* /home/container/data/plugins

hostname > /home/container/data/hostname.txt
echo "${IS_DEVELOPMENT_SERVER}" > /home/container/data/development_server.txt

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx5G --enable-preview -jar server.jar

