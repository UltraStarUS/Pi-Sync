#/bin/bash!
#ajaxx . delete-button
#version 1, it has no error handling so don't type in anything wrong or you have to start over
#Set the Name of the SSH Keys
echo "Enter the Pi's Hostname"
read hostName
echo 'Hit enter when prompted'
ssh-keygen -b 2048 -t rsa -f $hostName 
#Set the IP address of the remote Pi
echo 'Input the IP of the remote Pi'
read IP
#Pushes the key and the remote script to the pi
#Requires input from user for initial authentication
scp $hostName.pub remotescript.sh pi@$IP:~/
#Also requires authentication from user, sets remotescript to executable, executes, and exits
ssh -T pi@$IP "cd ~; chmod 700 remotescript.sh; ./remotescript.sh $hostName; exit;"
#Moves the private key somewhere better than wherever this is executed
mv $hostName /home/pi/.ssh/
mv $hostName.pub /home/pi/.ssh/
#This builds the script that will run rsync for each Pi
echo ' Time for the Automated Script'
echo '*******************************'
#This is the directory from which the pi will sync up to
echo 'Input a Source Directory (from the following)'
ls /samba/pi/pishare/
read srcPath
#Creates the new script, makes it executeable and executes it
touch Pi-Sync_$hostName.sh
echo '#/bin/bash!' >> Pi-Sync_$hostName.sh
echo "rsync --progress -avz --delete-before -e \"ssh -i /home/pi/.ssh/$hostName\" /samba/pi/pishare/$srcPath/ pi@$IP:/home/pi/Desktop/share/" >> Pi-Sync_$hostName.sh 
chmod 700 Pi-Sync_$hostName.sh
if [ ! -d ~/.rsync ]; then mkdir ~/.rsync/; fi
chmod 700 ~/.rsync/
mv Pi-Sync_$hostName.sh /home/pi/.rsync/
/home/pi/.rsync/./Pi-Sync_$hostName.sh
#Sets the new script on the user's time table to be run every 5 minutes
crontab -l > tmpCron
echo "*/5 * * * * /home/pi/.rsync/./Pi-Sync_$hostName.sh" >> tmpCron
crontab tmpCron 
#Clean up the garbage files
rm tmpCron 
rm /home/pi/.ssh/$hostName.pub
echo 'Script Created, Syncing ready' 