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

cp -rv /data/$LOCATION/servers/plugins/bungee/* /home/data/plugins
cp -rv /data/$LOCATION/servers/configs/bungee/* /home/data

echo "${IS_DEVELOPMENT_SERVER}" > /home/data/development_server.txt

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx2G --enable-preview -jar server.jar
