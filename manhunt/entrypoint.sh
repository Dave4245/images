#!/bin/bash

cd /home/container || exit

echo "==============================================================================="
echo "-> Deleting all server files.."
echo "==============================================================================="

rm -r /home/container/*

echo "==============================================================================="
echo "-> Downloading new server files."
echo "==============================================================================="

rsync -chavvvzrPe --list-only root@185.249.218.124:/root

echo "===============================================================================1"


rsync -chavvvrzPe --list-only root@185.249.218.124:/root/

echo "===============================================================================2"

rsync -chavvvzrPe --list-only root@185.249.218.124:/root/templates

echo "===============================================================================3"

rsync -chavvvzrPe --list-only root@185.249.218.124:/root/templates/

echo "===============================================================================4"

rsync -chavvvzrPe root@185.249.218.124:/root/templates/manhunt/ /home/container/

echo "==============================================================================="
echo "-> Starting server."
echo "==============================================================================="

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
eval ${MODIFIED_STARTUP}
