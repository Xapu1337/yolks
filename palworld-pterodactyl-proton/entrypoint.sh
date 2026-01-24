#!/bin/bash
# Wait for the container to fully initialize
sleep 1
TZ=${TZ:-UTC}
export TZ

cd /home/container || exit 1

# Output Current Wine Version
wine --version
proton --version

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
