#!/bin/bash

cd /home/container || exit

echo "==============================================================================="
echo "-> Deleting all server files."
echo "==============================================================================="

rm -r /home/container/*

echo "==============================================================================="
echo "-> Downloading new server files"
echo "==============================================================================="

rsync -arvz -e 'ssh -p 22' --progress /home/container/ root@185.249.218.124:templates/manhunt/

echo "==============================================================================="
echo "-> Starting server."
echo "==============================================================================="

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
eval ${MODIFIED_STARTUP}
