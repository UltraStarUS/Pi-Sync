#/bin/bash/!
filename='.names4'
exec 4<$filename
echo Yeehaw
touch Collection
while read -u4 line ; do 
	line=${line%$'\r'}
	## Prints out the Name of the Pi being connected to
	echo $line >> Collection
	## Gets the current number of hours and days that a Pi has been online
	#ssh -i ~/.ssh/${line^^} -t pi@$line "uptime" >> Collection
	## Gets the current IP address of the Pi
	#ssh -i ~/.ssh/${line^^} -t pi@$line "ifconfig eth0 | grep 192" >> Collection
	## Gets the current amount of free space on the Pi
	#ssh -i ~/.ssh/${line^^} -t pi@$line "df" >> Collection
	## Reboots the Pi
	#ssh -i ~/.ssh/.Piserver -t pi@$line "sudo shutdown -r now"
	## Insert required command you want run on the Pi in the quotes below
	#ssh -i ~/.ssh/.PiServer -t pi@$line ""
done
