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

rm -rv /home/container/data/
mkdir -pv /home/container/data/

cp -rv /data/$LOCATION/systems/CentralControl.jar /home/container/data
chmod /var/run/docker.sock

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/container/data || exit
exec java -Xms128M -Xmx1G --enable-preview -jar CentralControl.jar
