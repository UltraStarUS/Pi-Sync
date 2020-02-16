#/bin/bash!
# ajaxx . delete-button
# Nginx and PHP Section <>
# Straight up Ripped from:
## https://www.linuxbabe.com/ubuntu/install-lemp-stack-nginx-mariadb-php7-2-ubuntu-18-04-lts
echo 'yee'
apt update &&  apt upgrade -y
apt install nginx -y 
apt install php7.2 php7.2-fpm php7.2-cli php-common php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl -y 
systemctl enable nginx &&  systemctl start nginx && systemctl status nginx
Chown www-data:www-data /usr/share/nginx/html/ -R 
systemctl start php7.2-fpm &&  systemctl enable php7.2-fpm && systemctl status php7.2-fpm
rm /etc/nginx/sites-enabled/default
cp default.conf /etc/nginx/conf.d/
## need to test before deployment
echo "php_admin_value[date.timezone] = America/Phoenix" >> /etc/php/7.2/fpm/pool.d/www.conf
echo 'haw'
# Samba Section <>
# Straight up Ripped from:
## https://linuxize.com/post/how-to-install-and-configure-samba-on-ubuntu-18-04/
## and https://raymii.org/s/tutorials/SAMBA_Share_with_Active_Directory_Login_on_Ubuntu_12.04.html
apt install ntp krb5-user samba cifs-utils smbclient winbind libnss-winbind
systemctl status nmbd
echo "server 192.168.241.208"
echo "server 192.168.241.208" >> /etc/ntp.conf
echo "nameserver 192.168.241.208" > etc/resolv.conf
echo "search ultrastarus.com" >> etc/resolv.conf 
cp /etc/krb5.conf /etc/krb5.conf.bak
cat krbconf > /etc/krb5.conf
clear
echo "Enter the password :^)"
kinit piserv
klist
cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
cat nssconf > /etc/nsswitch.conf
mkdir /samba/
mkdir /samba/PiShare/
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak 
cat smb.conf >> /etc/samba/smb.conf 
net rpc getsid
systemctl restart nmbd
systemctl restart winbind
systemctl restart smbd
echo "do it again :^)"
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
apt install tasksel
tasksel install xfce4-slim
service slim start
cp x11vnc /home/pi/.config/autostart/
cp X11VNC.desktop /home/pi/.config/autostart/
clear
echo "Done"
