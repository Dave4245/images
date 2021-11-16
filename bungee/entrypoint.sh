#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="


rm -rv /home/container/data/
cd /data || exit
cp -Rv . /home/container/data/
hostname > /home/container/data/server-name.txt

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cd /home/container/data || exit
ls
exec "java -Xms128M -Xmx1G --enable-preview -jar server.jar"
