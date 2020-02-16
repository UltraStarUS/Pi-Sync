#/bin/bash!
# ajaxx. delete-button 
# Accidentally deleted the file so this is a rewrite
# hostName is the name of the key made and is passed from initscript into this when run on the target / remote machine
hostName=$1
# This is to confirm the pwd
cd ~
# This is to check for the `.ssh/` folder, and to make it if it doesn't already exist
if [ ! -d .ssh ]; then mkdir .ssh/; fi
# Adds permissions to thte `.ssh/` folder, and moves the public key into it, then moves the pwd into `.ssh/`
chmod 700 .ssh/
mv $hostName.pub ~/.ssh/
cd ~/.ssh/
# Checks for the authorized_keys file, makes it if it needs to
if [ ! -f authorized_keys ]; then touch authorized_keys; fi 
# Confirms permissions of the `authorized_keys` file and appends the public key to it
chmod 600 authorized_keys
cat $hostName.pub >> authorized_keys
#Changes the working directory so that the script can delete itself off of the target / remote machine
cd ~
rm remotescript.sh