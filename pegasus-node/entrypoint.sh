#!/bin/sh
# Entrypoint for Pegasus-Node
# Created by Ilija Culap

# Remove known_hosts and start connection
echo "Establishing connection"
rm /root/.ssh/known_hosts
exec autossh -N -M 0 \
-o "StrictHostKeyChecking off" -o "UserKnownHostsFile /dev/null" \
-o "ServerAliveInterval 5" -o "ServerAliveCountMax 1" \
-N $PEGASUS_MASTER_IP -p ${PEGASUS_MASTER_PORT:-22} \
-R *:$PORT_ON_MASTER:$GOTO_IP:$GOTO_PORT \
-l root -i /root/.ssh/id_rsa
