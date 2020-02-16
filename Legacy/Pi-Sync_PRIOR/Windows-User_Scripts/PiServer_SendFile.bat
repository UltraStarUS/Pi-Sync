:: ajaxx . delete-button
@echo off
:: Sends all of the files that are in the folder `Files-To-Send` 
:: This is basically only for Bubbs
echo Confirm that the file(s) you are sending are in the folder `Files-To-Send`
echo Press `Enter` to continue
cls
echo Enter the Location (number) on the Pi Server that you would like to send these Files.
SET /P DIRECTORY="Home Folder (1), Webserver (2), Posters (3)"
IF "%DIRECTORY%"=="1" (scp -i PiServer -r Files-To-Send\ pi@192.168.240.239:~/ & ssh -i PiServer -t pi@192.168.240.239 "cd ~/; mv Files-To-Send/* .; rm -rf Files-To-Send")
IF "%DIRECTORY%"=="2" (scp -i PiServer -r Files-To-Send\ pi@192.168.240.239:~/ & ssh -i PiServer -t pi@192.168.240.239 "cd ~/; sudo mv -f Files-To-Send/ /usr/share/nginx/html/Theaterboards/; cd /usr/share/nginx/html/Theaterboards; sudo chmod 777 -R Files-To-Send/; sudo chown www-data:www-data -R Files-To-Send/; sudo mv Files-To-Send/* .; sudo rm -rf Files-To-Send")
IF "%DIRECTORY%"=="3" (scp -i PiServer -r Files-To-Send\ pi@192.168.240.239:~/ & ssh -i PiServer -t pi@192.168.240.239 "cd ~/; sudo mv -f Files-To-Send/ /usr/share/nginx/html/Theaterboards/posters/; cd /usr/share/nginx/html/Theaterboards/posters/; sudo chmod 777 -R Files-To-Send/; sudo chown www-data:www-data -R Files-To-Send/; sudo mv Files-To-Send/* .; sudo rm -rf Files-To-Send")