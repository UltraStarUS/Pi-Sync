#/bin/bash!
#ajaxx . delete-button
# For use when the boxofcxml.001 file needs to get grabbed again. 
sudo mount -t cifs '//vista-akchin/VISTA/Extracts/ExtractResults/' /home/pi/.webbackup/mntpoint/ -o cred=/root/.cred/.cred
echo 'mounted'