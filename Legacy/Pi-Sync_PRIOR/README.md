# Welcome to the Pi-Sync Repositiory!

## This repo holds the following
- `initscript.sh`
- `remotescript.sh`
- `PiServer_Connect.bat`
- `PiServer_Re-Sync.bat`
- `PiServer_Reboot.bat`
- `PiServer_SendFile.bat`
- `Service.Install.sh`
- `webdata-Sync.sh`
- `xml-Sync.sh`
- `delete-Script.sh`
- `config-Sync.sh`
- `config-Crontab.sh`
- `defautl.conf`
- `README.md`
## Purpose
To allow for a seamless and automated upadating / syncing of linux machines utilizing rsync, hardcoded directories and users,
  as well as the initialization and configuration of SSH Keys between the host machine and remote machines. 
  
  As well as hosting and keeping up a Webserver and SMB Share drive for use with other systems in its enviornment  

## Programs Needed
The entire system is built on a Linux Ubuntu 18.04 build, running these custom scripts and opensource / default tools. 
Things needed for whole project: 
- git
- scp
- rsync
- crontab

Sudo / root level access is also required for a few of the scripts to function
## Explanation
  The signage works in one of two ways: either a chromium page that displays certain content, or a source folder on the device that shows videos/pictures.
  This repo / solution has systems in place for both. 
  ### Chromium
  Firstly, the chromium page. This is solved using two services: `nginx` and `php7.2-fpm`. These provide pages on the servers ip address that the pis can connect to and broadcast.

  This uses `cron` to scedule the times at which certain files need to be grabbed from `vista-akchin` and adds them to the webserver's data.
  ### Syncing
  Secondly, the source folder. By using `rsync` and ssh keys the files that need to be sent to the pis are done so securely and in a timely fashion. 
  
  This uses `cron` to schedule syncing times between pis and the server.

## Basic Instructions
First, make sure everything is installed, I'm not sure exactly what part in the process you'll be in if you're reading this but make sure to follow the solution I typed up in the `Pi-Server_Setup` file. However, for the scripts in this repo you need to run `chmod 700 SCRIPTNAME` where SCRIPTNAME is of course the script you want to run, that needs to happen before you can
run any of these scripts (outside of the windows/batch ones), then you want to make sure you're using the right one. 

When loading up a Pi for the first time, you need to run `initscript.sh` this will start the process for `rsync` and the ssh keys that it needs in order to function autonomously. 

`remotescript.sh` is only run by `initscript.sh` and does not need to be modified at all. 

When setting up the webserver component, refer to the installation solution in the `Pi-Server_Setup` file, but you will be using / reffering to the `Service.Install.sh` script, which should automate most 
of the process. 

When you are modifing a script, decomming a Pi, or anything like that, you need to run the scripts in `deletions-removals` and `configurations`. 

Everything involving connecting through windows / from other systems is in the `Pi-Server_Interaction` file. 
## Troubleshooting
If anything goes **_wrong_**, remember a few key commands and things to look out for 

- *super big thing*, if you want to know how a script works or functions, read the comments I put in to each script. This can be done by running `cat SCRIPTNAME`, that will display everything that is written in the script and therein any comments. 
- Confirm that ssh is running on the _remote_ machine and that ssh is installed on the _host_
- If ssh is installed and the script still doesn't work, try deleting the `~/.ssh/` folder on the _remote_ machine, then trying again
        - This can be done by typing in the following on the _remote_ machine: `cd ~` followed by `rm -rf .ssh/`
- Confrim that scp is installed on the _host_ machine
        - If running Manjaro / arch, run `pacman -Fs scp` then install the package that is displayed 
        - If running debian / raspbian, run `apt-cache search scp` then install the package that is displayed
        
- You will need to know the password of the hardcoded account of the _remote_ machine, this is `pi` until a change has been noted

 - All inputs into the scripts are not checked for faults or incorrect inputs, if a script fails quickly after executing it may be because of this
 
- Make sure to check the `~/.ssh/` folder on both the _remote_ and _host_ machines 

- If the script fails at the `crontab` section, confirm what is in the crontab file by typing `crontab -l > runTab` then `nano runTab` if there is a new entry then delete the line using nano, then type `crontab runTab && rm runTab`



//https://help.github.com/en/articles/basic-writing-and-formatting-syntax

//ajaxx . delete-button