#/bin/bash/!
#ajaxx . delete-button
echo 'Yeehaw'
echo 'Enter the name of the Pi'
read name
echo 'Enter the folder path for the Pi'
read folder
ssh-keygen -f "/home/pi/.ssh/known_hosts" -R $name
cd ~/Pi-Sync/initialscripts/
./initscript1.sh $name $folder