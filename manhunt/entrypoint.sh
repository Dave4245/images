#!/bin/bash
cd /home/container || exit
echo "Deleting all server files."
rm -r /home/container/*
echo "Downloading new server files from https://templates.exeomc.net/gamemode/manhunt"
wget -O https://templates.exeomc.net/gamemode/manhunt
echo "Starting server."
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
eval ${MODIFIED_STARTUP}
