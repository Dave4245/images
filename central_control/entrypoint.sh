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
mkdir -pv /home/data/

cp -rv /data/$LOCATION/systems/CentralControl.jar /home/data

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx1G -Dlog4j2.formatMsgNoLookups=true --enable-preview -jar CentralControl.jar
