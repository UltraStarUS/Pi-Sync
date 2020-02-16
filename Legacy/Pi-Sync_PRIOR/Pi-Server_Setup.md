# Pi Server Setup

This, for now, will be the full documentation of the Pi Server Signage Project. 

## Explanation and Reasoning

### Explanation

The current Signage system here is built in three parts: dedicated Ad boards, Theater signage that points to a web-page, Menu and Ad signage that displays locally stored videos and pictures. 
The Pi Server is meant to bridge the gap between the latter two parts and interface with Marketing when new data is being deployed. 

The Deployed Pi Server needs to be able to do three things: Host a share Drive, Serve web-pages for signage across the building, Sync the data between all Pis in the Building.

#### Hosting
--
#### Serving

Serving is handled through the use of the `Linux, Nginx, PHP` stack, or `LEP` stack. A system, running linux, will run an Nginx Webserver using PHP-FPM services to serve websites using the webdata created by Arthur. 
#### Syncing
Finally, syncing is handled through the use of `Secure Shell`, or ssh, connections and automated scripts that will be talked about in more depth later on, they are hosted here.
Reasoning
Firstly, the hardware choices here make the most sense for our uses as there is limited overhead; no need for a back-end system with proprietary connections or equipment that can get immensely costly overtime. By utilizing cheap and effective Raspberry Pi's we are able to streamline the process of resets and configurations in the wake of issues, and preform basic tasks on them without having to take down Signage boards. 
Secondly, the use of Nginx over something like Apache is simply based on its ease of use. It is essentially an install and configure option, rather than install, configure, maintain and optimize. 

Lastly, the use of ssh connections is a business / best practices standard that allows for a simple and secure connection between server and client. By using automated scripts, in the event of a failure it is relatively simple to manually activate certain scripts immediately and fix the issue with less of a rush to finish. 

## Initialization and Basic Setup

First and Foremost, click here
The Linux Distribution that we used for this process was `Ubuntu Desktop 18.0.4`, This can work with Server but will not be gone over here. 
Now that the soundtrack has been selected, we can begin.

### Hardware

There are essentially two ways that the server can be set up. One being a physical computer, the other being a Virtual Machine, or VM. I will go over both options, using Hyper-V as the Virtual Machine center (as it is easily installed on windows systems).
#### Physical Computer
1. Procure:
    - A system (working, w/ hard drive and enough ram to support a web-server)
    - A monitor, Keyboard, Mouse, and cables for all
    - A USB Drive (at least 8gb)
    - Like a Redbull or something just in case
1. Another system to get the USB set up, (with all from step 2)
    - Download the new Operating system here, onto the system from step 1.5
1. Plug in the USB from step 1.3 once the .iso file from step 2 has been downloaded
1. Download or run the application `Rufus` from this page, it should look like the following picture once run (v3.6)
1. Under Device select the USB that you've plugged in
1. Click on `SELECT` and select the .iso file you've just downloaded in file explorer
1. Leave all the other buttons as they are and press `START`
1. Once it has finished, the USB is ready. 
1. Take a sip of your redbull
1. Plug in all the peripherals procured from step 1 into the system (also from step 1), as well as the newly finished USB. 
1. Turn it on and press the corresponding Boot selector button (Dell - F12, HP - DEL) and choose a USB Device. 
1. Once the system boots to a purple~ish kind of screen, or into a screen that looks like the following, stop and move on to the next Section.

#### Hyper-V VM
1. Procure 
    -A system to do this on, including monitor, keyboard, windows 10, mouse. 
1. Confirm that Hyper-V is installed or to install it for the first time
    -Press the windows key, type `features` and select `Turn Windows Features on and off`
    -Then check the box called 'Hyper-V' as pictured

1. Download the new Operating system here
1. Once your system installs it and restarts, open Hyper-V Manager
1. Click on `New` in the right most Panel, as pictured
1. Then, Select Virtual Machine
1. Give it a cool name, like `Pi-Server`, `PiServer`, `Piserver`, even `PISERVER`
1. Select Generation 1 on the next screen
1. Give the Virutal machine enough Startup memory for it to run well enough during the setup phase
    - I suggest 2-4 Gbs of Ram, or 2048 - 4096 MB
1. Leave networking alone
1. Change the size of the Virtual hard Disk, as pictured, down to something more reasonable (32-64 gb max).
1. On the next page, Select `Install an operating system from a bootable CD/DVD-ROM` and select `Image file (.iso)` and press `Browse` selecting the .iso file that you downloaded.
1. Then Click on `Virtual Switch Manager...`
1. Make sure that `External` is selected and Click `Create Virtual Switch`
1. Name it however you want and 
1. Hit finish, then stop and move onto the next section.

### Software
    Regardless of the type of install you're doing (Physical or Virtual) the steps from here on are about the same. 
#### OS Setup
1. Turn on and boot into each, in Hyper-V right click the VM you made and click connect then select `Power` or `Turn` on 
1. When you get here, select `Install Ubuntu`
1. When asking for Keyboard layout (unless you're dvorak) select continue in the bottom right
1. Following, Select `minimal Install` and `Download Updates while installing ubuntu` then hitting continue
1. Unless Specifically requested not to select `Erase disk and install Ubuntu` and click `Install Now`
1. Then hit continue when it asks you about Drive information
1. Chose Phoenix as your Timezone and hit continue    
1. All of the scripts and documentation following this point are written for the following `Who are you?` options (except password), please type in whatever comes after the colon:
    - Your name: "Steve"
    - Your Computer's name: Pi-Server
    - Pick a username: pi
1. Type in a strong and memorable password, or generate one and save it in a keyring.
1. Select `Log in automatically`, though this is insecure, it is a requirement for the VNC Settings later on.
1. Press Continue and Drink some more redbull, it won't take too much longer but then we get to do the cool stuff. 
#### Software Downloads and Initialization 
This will fulfill the Serving and Syncing Portions of the system  

1. First, Open a new Terminal on the Machine you are working on (Use the shortcut: CTRL + SHIFT + T)
1. Type the first of many commands, `sudo apt update && sudo apt upgrade -y`, this will update the location from which you download the applications later on. 
    - Use the Password you chose when prompted
1. This might take a while, so in the mean time type `ip -a` in another terminal, this will give you your network configuration information which will be required when setting up Pi's later on. The output should look like the following:

1. Look over `2:` or `eth0` in this case, the number following `inet` on the third line of `2:` is the IP Address of the system. Record this as you will need it later.
1. Now, in the first terminal, type in `sudo apt install git` this will help us with the basics.
1. Finally, in this section, type in `cd ~ && git clone https://github.com/delete-button/pi-sync`
## Advanced Setup 

### Setting up the scripts
