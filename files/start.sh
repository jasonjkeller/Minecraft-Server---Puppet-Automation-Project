#!/bin/bash
if [ -f /var/run/minecraft.pid ] && ps -p `cat /var/run/minecraft.pid` | grep -q 'java.*minecraft'
then
	# process exists and appears to be running minecraft
	echo "Minecraft Server Running"
else
	# nope
	su minecraft -c java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui > /var/log/minecraft.log 2>&1 &
        echo $! >/var/run/minecraft.pid
fi
