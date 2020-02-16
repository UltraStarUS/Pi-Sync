:: ajaxx . delete-button
@echo off
:: Runs the `webserver/xml-Sync.sh` script
echo Syncing Pi Server with Vista...
ssh -i PiServer -t pi@192.168.240.239 "cd ~/Pi-Sync/webserver/; sudo ./xml-Sync; exit;"
echo Done 