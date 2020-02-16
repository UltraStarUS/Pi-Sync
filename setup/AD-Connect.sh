#/bin/bash!
#ajaxx . delete-button
## For use when the Pi Server loses its AD lease / Connection / Authentication
## YOU HAVE TO TYPE THE PASSWORD PROPERLY THE FIRST AND ONLY TIME
kinit piserv
klist
net rpc getsid
systemctl restart nmbd
systemctl restart winbind
systemctl restart smbd
net ads join -U piserv
wbinfo -u
wbinfo -g
getent passwd
getent group
systemctl restart nmbd
systemctl restart winbind
systemctl restart smbd