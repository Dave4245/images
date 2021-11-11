#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

cd /data || exit
echo "==============================================================="
ls .
cp -rv . /home/container

cd /home/container || exit
echo "==============================================================="
ls .

cat > server-name.txt <<- "EOF"
${SERVER_NAME}
EOF

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

cat /etc/hosts

eval "java -Xms128M -Xmx5G --enable-preview -jar server.jar"
