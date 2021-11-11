#!/bin/bash

java -version

cd /home/container || exit

echo "==============================================================================="
echo "-> Deleting all server files.."
echo "==============================================================================="

rm -r /home/container/*

echo "==============================================================================="
echo "-> Downloading new server files."
echo "==============================================================================="

sudo rsync -avvvz container@185.249.218.124:/root/templates/manhunt/ /home/container/

echo "==============================================================================="
echo "-> Starting server."
echo "==============================================================================="

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
eval ${MODIFIED_STARTUP}
