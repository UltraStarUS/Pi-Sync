# Welcome to the Pi-Sync Repositiory!

## Purpose
Automated upadating / syncing of image and video data between linux machines utilizing rsync, hardcoded directories and users,
  as well as the setup and configuration of the central Server. 

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
  Firstly, the chromium page. This is solved using two services: `nginx` and `php7.2-fpm`. These provide pages on the servers ip address that the endpoints can connect to and broadcast.

  This uses `cron` to scedule the times at which certain files need to be grabbed from a Point of Sales Server and adds them to the webserver's data.
  ### Syncing
  Secondly, the source folder. By using `rsync` and ssh keys, the files that need to be sent to the endpoints are done so securely and are scheduled on the endpoint's crontab. 
## Basic Instructions
First, make sure the Programs Needed are installed, the setup is pretty well explained in the `Pi-Setup.html` file. Regardless, the scripts in this repo need to be modified with `chmod 770 SCRIPTNAME` (where SCRIPTNAME is the script you want to modify)

That command must be run any of these scripts (outside of the windows/batch ones) in order for them to be used. 

Everything involving connecting through windows / other systems is in the `Pi-Server_Interaction` file. 
## Troubleshooting
If anything goes **_wrong_**, remember a few key commands and things to look out for 

- *super big thing*, if you want to know how a script works or functions, read the comments I put in to each script. This can be done by running `cat SCRIPTNAME`, that will display everything that is written in the script and therein any comments. 
- Confirm that ssh is running on the _endpoint_ machine and that ssh is installed on the _server_
- If ssh is installed and the script still doesn't work, try deleting the `~/.ssh/` folder on the _endpoint_ machine, then trying again
        - This can be done by executing in the following on the _endpoint_ machine: `cd ~` followed by `rm -rf .ssh/`
- Confrim that scp is installed on the _server_ machine
        - If running Manjaro / arch, run `pacman -Fs scp` then install the package that is displayed 
        - If running debian / raspbian, run `apt-cache search scp` then install the package that is displayed

 - All inputs into the scripts are not checked for faults or incorrect inputs, if a script fails quickly after executing it may be because of this
 
- Make sure to check the `~/.ssh/` folder on both the _endpoint_ and _server_ for data that is not meant to be there

//https://help.github.com/en/articles/basic-writing-and-formatting-syntax

//ajaxx . delete-button