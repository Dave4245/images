#!/bin/bash

java -version

LOCATION=""
IS_DEVELOPMENT_SERVER=""

if test -z "$DEVELOPMENT_SERVER"; then
  LOCATION="development"
  IS_DEVELOPMENT_SERVER="true"
else
  LOCATION="production"
  IS_DEVELOPMENT_SERVER="false"
fi

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -rv /home/container/data/
mkdir -pv /home/container/data/plugins/

cp -rv /data/$LOCATION/servers/plugins/bungee/* /home/container/data/plugins
cp -rv /data/$LOCATION/servers/configs/bungee/* /home/container/data

echo "${IS_DEVELOPMENT_SERVER}" > /home/container/data/development_server.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx1G --enable-preview -jar server.jar
