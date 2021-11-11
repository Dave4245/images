#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cd /data || return
ls .

cp -rv /data/ /home/container

cd /home/container || exit
ls .

cat > ServerName.txt <<- "EOF"
${SERVER_NAME}
EOF

ls .

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

eval "java -Xms128M -Xmx7000M --enable-preview -jar server.jar"
