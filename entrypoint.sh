#!/bin/ash
sleep 1

cp /usr/bin/caddy /home/container/caddyserver

cd /home/container
chmod +x ./caddyserver

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
