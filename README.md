# Minecraft Server - Puppet Automation Project
Minecraft server managed by Puppet Labs configuration management system.

#### Minecraft Server Installation

System Requirements: minimum 1GB RAM (2GB RAM Recommended)
* Step 1 (update apt-get): sudo apt-get update
* Step 2 (check if Java is intsalled): java -version
* Step 3 (install Java if it isn't already): sudo apt-get install default-jdk
* Step 4 (install Screen): sudo apt-get install screen
* Step 5 (create server installation directory): mkdir minecraft
* Step 6 (switch to server installation directory): cd minecraft
* Step 7 (download Minecraft server): wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.7.10/minecraft_server.1.7.10.jar
* Step 8 (start Screen): screen -S "Minecraft server"
* Step 9 (run server): java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
```
To exit screen: ctl-a d
To reattach screen: screen -R
Edit server settings: nano ~/minecraft/server.properties
```
