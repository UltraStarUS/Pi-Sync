#/bin/bash/!
# ajaxx . delete-button
# Allows for the configuration of Sync Scripts post creatin
# Not my best work but does exactly what it needs to and nothing else

# All our scripts are going to be stored here, this just moves the 
# pwd to the stoarge directory for the scripts
cd ~/.rsync/
echo "Please enter the Pi's Hostname"
read hostName
echo 'This is the current configuration, Press ctrl+C if you do not wish to make changes, otherwise hit enter'
cat Pi-Sync_$hostName.sh | grep rsync
# This presents the user with the option of either continuing or stopping based on current configuration
read
echo 'Input the IP address'
read IP
# This is the (re)configuration of the Source Directory
# otherwise known as the source of the data being synced to the _remote_ device
echo 'Input the Source Directory (from the following as written)'
ls /samba/pi/pishare/*
read srcPath
# Presents the User with the current changes and allows for another opportunity to cancel
echo "IP: $IP, Source Directory: pishare/$srcPath/"
echo 'Are these inputs correct? (Hit enter to continue. If not, hit ctrl+C to cancel)'
read
echo 'Reconfiguring Script'
# Pushes the required data to the script, reconfiguring it and letting the user know what is happening
echo '#/bin/bash!' > Pi-Sync_$hostName.sh
echo "rsync --progress -avz --delete-before -e \"ssh -i /home/pi/.ssh/$hostName\" /samba/pi/pishare/$srcPath/ pi@$IP:/home/pi/Desktop/share/" >> /home/pi/.rsync/Pi-Sync_$hostName.sh
sleep 1
clear
echo 'Reconfigure Complete'