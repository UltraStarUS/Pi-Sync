#/bin/bash!
#ajaxx . delete-button
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
