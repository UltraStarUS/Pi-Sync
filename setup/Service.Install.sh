#/bin/bash!
# ajaxx . delete-button
# Nginx and PHP Section <>
# Straight up Ripped from:
## https://www.linuxbabe.com/ubuntu/install-lemp-stack-nginx-mariadb-php7-2-ubuntu-18-04-lts
echo 'yee'
# This is just to get the server up to date on all downloads moving forwards
apt update &&  apt upgrade -y
# VNC and SSH Servers
apt install x11vnc openssh-server -y
# Nginx server and PHP servers 
apt install nginx -y 
apt install php7.2 php7.2-fpm php7.2-cli php-common php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl -y 
# Gets Nginx and PHP set to start on startup
systemctl enable nginx &&  systemctl start nginx && systemctl status nginx
chown www-data:www-data /usr/share/nginx/html/ -R 
systemctl start php7.2-fpm &&  systemctl enable php7.2-fpm && systemctl status php7.2-fpm
# Sets the Nginx configuration setttins
rm /etc/nginx/sites-enabled/default
cp default.conf /etc/nginx/conf.d/
# Sets the Time value for the php server to Phoenix so that the grayed out show times are accurate
echo "php_admin_value[date.timezone] = America/Phoenix" >> /etc/php/7.2/fpm/pool.d/www.conf
echo 'haw'
# Samba Section <>
# Straight up Ripped from:
## https://linuxize.com/post/how-to-install-and-configure-samba-on-ubuntu-18-04/
## and https://raymii.org/s/tutorials/SAMBA_Share_with_Active_Directory_Login_on_Ubuntu_12.04.html
# samba and requiste programs
apt install ntp krb5-user samba cifs-utils smbclient winbind libnss-winbind
# get the status of nmbd and set it to start on boot
systemctl enable nmbd
systemctl status nmbd
# Set the nameserver (DNS)
echo "server 192.168.241.208" >> /etc/ntp.conf
echo "nameserver 192.168.241.208" > etc/resolv.conf
echo "search ultrastarus.com" >> etc/resolv.conf 
cp /etc/krb5.conf /etc/krb5.conf.bak
cat krbconf > /etc/krb5.conf
clear
## This adds the pi server to the UltrastarUS active Directory using the piserver AD user
echo "Please enter the information for the piserv AD user"
echo "The applicable information will be in the FreshDesk Solutions"
echo "Once the password has been written in, press `ctrl+o` `enter` `ctrl+x` `enter`"
echo "Press Enter when ready"
if [ ! -d /root/.cred/ ]; then mkdir /root/.cred/; fi
cp .cred /root/.cred/
nano /root/.cred/.cred
echo "Enter the password :^)"
kinit piserv
klist
# Winbind settings
cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
cat nssconf > /etc/nsswitch.conf
# Builds the Pi Share folder
mkdir /samba/
mkdir /samba/PiShare/
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak 
cat smb.conf >> /etc/samba/smb.conf 
# more ad commands
net rpc getsid
systemctl restart nmbd
systemctl restart winbind
systemctl restart smbd
echo "do it again :^)"
# Syncs the Active Directory users with the PiServers active users (and groups)
net ads join -U piserv
wbinfo -u 
wbinfo -g 
getent passwd 
getent group
chmod -R 0770 /samba/PiShare/
chgrp -R "Domain Users" /samba/PiShare/
systemctl restart nmbd
systemctl restart winbind
systemctl restart smbd
clear
# Adds the Thursday 4:30 AM boxofcxml.001 file sync to the root crontab
touch tmpcron
crontab -l > tmpcron
echo "30 4 * * 4 /home/pi/Pi-Sync/webserver/./xml-Sync" >> tmpcron
crontab tmpcron
rm tmpcron
chmod 700 /home/pi/Pi-Sync/webserver/xml-Sync
# Adds in the remount and AD fix scripts to a folder named `.script`
if [ ! -d /home/pi/.script/ ]; then mkdir /home/pi/.script/; fi
chmod 770 Remount.sh
chmod 770 AD-Connect.sh
cp AD-Connect.sh /home/pi/.script/
cp Remount.sh /home/pi/.script/
cp Cleaner.sh /home/pi/.script/
cp Sync.sh /home/pi/.script/
echo "Setting up SSH"
if [ ! -d /home/pi/.ssh/ ]; then mkdir /home/pi/.ssh/; fi
cp .bashrc /home/pi/.bashrc
echo "Done"