#/bin/bash/!
cd ~/
echo "Collecting Data"
touch "$1_info"
echo "System $1" > "$1_info"
echo "Uptime: " >> "$1_info"
uptime >> "$1_info"
echo "IP Address" >> "$1_info"
ifconfig | grep "inet addr:19" >> "$1_info"
ifconfig | grep "inet 19" >> "$1_info"
echo "MAC Address" >> "$1_info"
ifconfig | grep eth0 >> "$1_info"
scp "$1_info" pi@192.168.240.239:~/Pi_Info