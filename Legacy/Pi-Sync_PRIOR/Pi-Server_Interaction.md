## Process for Connection / Basic Interactions

### Basic Explanation
    Here's the lowdown; There are basically three ways that you can interact with the Pi Server remotely.
- The SMB / Samba Share
- VNC (Virtual Network Computing)
- SSH (Secure Shell)
The following scripts and process will be utilizing the last option, ssh, in order to connect the end-user system (you) to the server. 
### Scripts?
Yeah, we have some scripts that will be stored in the IT Google Drive (here for now). Download the folder and you'll have access to all of them. Windows 10 (since 1803, I believe) has an ssh client built in to the command line, meaning that all you need to do is run the script, no weird installs or registry hacks here. 
Procedure:
1. Either navigate to the downloaded folder previously mentioned or download it here.
    - You will most likely have to unzip the folder if you download it, so make sure to do that before continuing.
2. Once you've either navigated to the folder or opened it after unzipping take a cursory look at the options to find what you need / want to do.
    1. PiServer_Connect.bat will give you an ssh connection to the Pi Server
    2. PiServer_Re-Sync.bat will grab and replace the `boxofcxml` file on the Pi Server with the newest available one from the Vista Server
    3. PiServer_Reboot.bat will reboot the Pi Server immediately
    4. PiServer_SendFile.bat will actually give you ice cream :^), and will send files from the folder on the host system straight to the Pi Server. 
4. Double click on the one you have found to be what you need, it will run and ask for a password (sometimes more than once) this is fine. Just type in [REDACTED] for both prompts and it will go through.
That's essentially it. Let's get into the Set up and Power-User type stuff now.
## Advanced Interactions / Pi Setup on Pi Server

For this section there are two ways to connect to the Pi Server depending on what the issue / event is. 
For an ssh connection, which will give you terminal access to the server allowing for commands to be run remotely, you don't need any other software and just need to access the scripts mentioned above. For a VNC connection however you do need a VNC Client of some kind in order to connect to the server. 
First However, we need to Understand what the available options are when you're on the system. 
Available are:
- Configure a Pi (for the First time)
- Change a Pi's configuration
- Adjust the timing of automated Script execution
- Delete a Pi's Configuration
All of those, can be done over ssh (and should be done over ssh). So we will pick up from the end of the last section, after having chose `PiServer_Connect.bat` and successfully connected to the server.
### Configuring a Pi
1. Follow the Set-Up instructions for a Pi, unless one has already been set up
1. Get the following information regarding the Pi
    - IP Address
    - HostName
    - Password (which should be obtainable from the Set-Up Instructions)
1. Now, open the Command Prompt / Terminal window with the open ssh Connection
    - The one you made by following the Steps in `Scripts?`
1. This Window should look a bit like the one pictured, here you want to run the command `cd ~/Pi-Sync` (excluding ` from here and on)
1. Now run the command `l`, this will show all of the data in the directory (including folders which will be blue) 
1. For the Configuration of  Pi, you will want to run the command `./initscript.sh`
    - The screen will pop up with questions referring to Step 2, enter them as they come and don't spell anything incorrectly (think twice, type once).
1. Congrats, you've setup a Pi. yes you really did.
### Changing a Pi's Configuration
1. Get the following information regarding the Pi
    - IP Address
    - HostName
    - Password (which should be obtainable from the Set-Up Instructions)
1. Now, open the Command Prompt / Terminal window with the open ssh Connection
    - The one you made by following the Steps in `Scripts?`
1. Run the Command `cd ~` followed by `Pi-Sync/configurations/./config-Sync.sh`
    - This will start the Script you need in order to begin configuring the Syncing Scripts for the Pis. Follow the onscreen prompts clearly. Remember: think twice, type once.
1. Congrats, you changed the configuration on Pie. **wait--**
### Adjust the Timing of a Pi
1. If you need to sync a Pi immediately, go to the next section, this is for change the number of minutes between syncs between the Server and Pis.
1. Get the following information regarding the Pi
    - IP Address
    - HostName
    - Password (which should be obtainable from the Set-Up Instructions)
1. Now, open the Command Prompt / Terminal window with the open ssh Connection
    - The one you made by following the Steps in `Scripts?`
1. Enter the command `~/Pi-Sync/configurations/./config-Crontab.sh`
    - This will start the Script you need in order to configure the Timing. Follow the onscreen prompts clearly. Remember: think twice, type once.
1. Fantastic, You did it. You can enter `crontab -l` if you want to verify your work. 
### Immediate Pi Syncing
1. Get the following information regarding the Pi
    - IP Address
    - HostName
    - Password (which should be obtainable from the Set-Up Instructions)
1. Now, open the Command Prompt / Terminal window with the open ssh Connection
    - The one you made by following the Steps in `Scripts?`
1. Enter the command `cd ~/.rsync/`
    - This will bring you to the directory of the stored scripts on the Pi Server
1. Enter the command `l`, this will list out each of the available scripts for syncing. 
1. Look for one that has the hostname of the Pi you are trying to sync in its name 
    - If you found one then continue. 
1. Now enter the command `./Pi-Sync_hostName.sh`, where `hostName` is the hostname of the Pi you are trying to sync.
1. Fantastic, You did it; Pi has been re-synced. 
    - If it didn't work, then follow the `Changing a Pi's Configuration` Section to reset the script configuration then go back through the steps of this section. 
### Deleting a Pi's Configuration Data
1. Obtain the Hostname of the Pi you're deleting
1. Now, open the Command Prompt / Terminal window with the open ssh Connection
    - The one you made by following the Steps in `Scripts?`
1. Enter the command `~/Pi-Sync/deletions-removals/delete-Script.sh`
    - Follow the onscreen prompts clearly. Remember: think twice, type once.
1. Congratulations! You've deleted the rascal 
## Web-Server Data / Configuration Updating

There are a few different options when it comes to making changes regarding the Web-Server. First, there's access method, second there's the actual action. The only Potential access methods are really SSH and VNC, both are available in the drive folder linked in the `Scripts?` section above. The actual actions are also limited but are: Re-Sync the Vista data with the Pi Server, upload files to the Pi Server, and modify the configurations of the Pi Server's Web-Server or SMB Server. These are the actions I will go over in this Section