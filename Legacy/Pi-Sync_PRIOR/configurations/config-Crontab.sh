#/bin/bash/!
# ajaxx . delete-button
# Executes commands allowing for the modification of Crontab for the logged in user
clear 
echo 'What is the name of the Pi you want to Modifiy?'
read hostName
clear
echo 'The following page will allow you to modifiy the Configurations for'
echo "automated script actions. Find the line that ends with Pi-Sync_$hostName.sh"
echo 'and change the number in the line. Then Press: Ctrl+O folowed by Ctrl+X to save changes'
echo "EXAMPLE:"
echo "*/5 * * * * /home/pi/.rsync/Pi-Sync_PiShovel.sh"
echo "All you change is the 5"
echo "*/15 * * * * /home/pi/.rsync/Pi-Sync_PiShovel.sh"
echo "Now, rather than resync every 5 minutes, it will sync every 15 minutes"
echo 'Press enter to continue and be brought to the Configuration Modification Page'
read
crontab -e 
clear
crontab -l | grep $hostname
echo "If the line has been altered correctly then continue, if not, rerun the script"
