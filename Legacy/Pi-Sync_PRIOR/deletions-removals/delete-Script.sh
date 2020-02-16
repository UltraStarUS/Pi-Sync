#/bin/bash/!
# ajaxx . delete-button
#Deletes all traces of script / keys / configuration on host
echo 'Input the Hostname of the Pi'
read hostName
# Removes the script and key from system 
rm /home/pi/.rsync/Pi-Sync_$hostName.sh
rm /home/pi/.ssh/$hostName 
echo 'The following page will allow you to modifiy the Configurations for'
echo "automated script actions, find the line that ends with Pi-Sync_$hostname.sh"
echo 'and delete it. Then Press: Ctrl+O folowed by Ctrl+X to save changes'
echo "EXAMPLE:"
echo "*/5 * * * * /home/pi/.rsync/Pi-Sync_PiShovel.sh"
echo "Just remove this line by pressing either backspace or delete in the text editor"
echo 'Press enter to continue'
read
crontab -e 
echo 'Script, ssh Key, and Cron Table entry have all been deleted'