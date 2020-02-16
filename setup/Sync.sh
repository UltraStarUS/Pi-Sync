#/bin/bash!
#ajaxx . delete-button 
echo -n "$1 just synced from $2 at " >> /home/pi/Pi_Guest-List.txt
date >> /home/pi/Pi_Guest-List.txt
rsync --progress -avz --delete-before -e "ssh -i /home/pi/.ssh/.PiServer" /samba/pi/pishare/$2/ pi@$1:/home/pi/Desktop/share
