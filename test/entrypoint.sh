#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cp -rv /data /home/container

cd /home/container || exit

cat > ServerName.txt <<- "EOF"
${SERVER_NAME}
EOF

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

eval "java -Xms128M -Xmx7000M --enable-preview -jar server.jar"
