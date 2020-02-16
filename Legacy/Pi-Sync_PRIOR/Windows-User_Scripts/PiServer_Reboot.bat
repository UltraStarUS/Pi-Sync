:: ajaxx . delete-button
@echo off
:: Only use when aboslutely Neccesary, but sends a reboot order to the Pi server
echo Rebooting Pi Server...
ssh -i PiServer -t pi@192.168.240.239 "sudo shutdown -r now"
echo Done 