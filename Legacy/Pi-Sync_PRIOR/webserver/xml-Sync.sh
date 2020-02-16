#/bin/bash/!
# ajaxx . delete-button

# This is an automated script that: 
# Grabs an .001 file from a network drop, backs up the webserver, applies the xml to the 
# content folder and cleans up after itself

# Time to grab the running config, if anything goes wrong we have a back up!
cp -r /usr/share/nginx/html/ ~/.webbackup/
# Using the cred file instead of passing creds through the script
sudo mount -t cifs '//vista-akchin/VISTA/Extracts/ExtractResults/' /home/pi/.webbackup/mntpoint/ -o cred=/root/.cred/.cred
# Copy, mv will cripple the whole building; cp makes it happy
cp /home/pi/.webbackup/mntpoint/NCRBOXOFCXML/boxofcxml.001 /usr/share/nginx/html/Theaterboards/

# we don't want this to be mounted to the system for very long
# the least amount of time connected to the `vista-akchin` server, the better
sudo umount /home/pi/.webbackup/mntpoint/
exit