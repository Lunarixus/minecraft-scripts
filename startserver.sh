#!/bin/sh

# Create screen session and run server
screen -d -m bash -c "java -Xms3G -Xmx3G -jar server.jar"

# Create screen session and run backup tool
screen -d -m bash -c "./backupworld.sh"
