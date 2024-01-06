#!/bin/ash
sleep 1

cp /usr/local/bin/caddy /home/container/caddy

cd /home/container
chmod +x ./caddy

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
