#!/bin/bash

java -version

echo "==============================================================="
echo "Downloading server files."
echo "==============================================================="

rm -r /home/container/

cd /data || exit
cp -rv . /home/container

cd /home/container || exit

cat > server-name.txt <<- "EOF"
${SERVER_NAME}
EOF

echo "==============================================================="
echo "Starting server."
echo "==============================================================="

expose PORT

eval "java -Xms128M -Xmx1G --enable-preview -jar server.jar"
