#/bin/bash!
#ajaxx . delete-button
sudo mount -t cifs '//vista-akchin/VISTA/Extracts/ExtractResults/' /home/pi/.webbackup/mntpoint/ -o cred=/root/.cred/.cred
echo 'mounted'
