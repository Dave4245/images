#!/bin/bash

java -version

LOCATION=""

if test -z "$DEVELOPMENT_SERVER"; then
  LOCATION="production"
else
  LOCATION="development"
fi

if test -z "$RAM"; then
  export RAM=6144
fi

function downloadFiles() {

    echo "==============================================================="
    echo "Clearing old server files."
    echo "==============================================================="

    rm -rv /home/data/
    mkdir -pv /home/data/plugins/

    echo "==============================================================="
    echo "Downloading server files."
    echo "==============================================================="
    hostname > /home/data/hostname.txt
    echo "${DEVELOPMENT_SERVER}" > /home/data/development_server.txt

}

function startServer() {

  echo "==============================================================="
  echo "Starting server. (This is a ${LOCATION} server)"
  echo "==============================================================="

  if test -z "$1"; then
      export RAM="$1"
  fi

  if test -z "$2"; then
        export JAR_NAME="server"
    fi

  cd /home/data || exit
  exec java -Xms128M -Xmx"${RAM}"M -Dlog4j2.formatMsgNoLookups=true --enable-preview -jar "${JAR_NAME}"

}

cp -rv /data/$LOCATION/servers/plugins/Minigame.jar /home/data/plugins
cp -rv /data/$LOCATION/servers/configs/minigame/* /home/data
cp -rv /data/$LOCATION/servers/configs/server.jar /home/data
cp -rv /data/$LOCATION/servers/plugins/core/* /home/data/plugins

echo "==============================================================="
echo "Starting server. (This is a ${LOCATION} server)"
echo "==============================================================="

