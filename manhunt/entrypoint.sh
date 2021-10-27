#!/bin/bash
cd /home/container || exit
echo "==============================================================================="
echo "[System] Deleting all server files."
echo "==============================================================================="
rm -r /home/container/*
echo "==============================================================================="
echo "[System] Downloading new server files from https://templates.exeomc.net/gamemode/manhunt/"
echo "==============================================================================="
wget -O https://templates.exeomc.net/gamemode/manhunt/
echo "==============================================================================="
echo "[System] Starting server."
echo "==============================================================================="
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
eval ${MODIFIED_STARTUP}
