#!/bin/bash

java -version

echo "==============================================================="
echo "Starting configuration server."
echo "==============================================================="

cd /home/data || exit
exec java -Xms128M -Xmx4G --enable-preview -jar server.jar

