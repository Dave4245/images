#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cd /data || exit
cp -rv . /home/container

cd /home/container || exit

cat > ServerName.txt <<- "EOF"
${SERVER_NAME}
EOF

echo "==============================================================="
echo "Starting server. (Updated)"
echo "==============================================================="

expose "${PORT}"

eval "java -Xms128M -Xmx7000M --enable-preview -jar server.jar"
