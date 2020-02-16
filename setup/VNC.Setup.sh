#/bin/bash!
#ajaxx . delete-button
# In order for the VNC server to work on startup these files have to be in the folder ~/.config/autostart
# x11vnc is the one that we are using, but this can be changed in the future for a better version if needed
if [ ! -d ~/.config/autostart ]; then mkdir ~/.config/autostart; fi
cp x11vnc ~/.config/autostart/
cp X11VNC.desktop ~/.config/autostart/
echo "Please enter either another strong password or the same password used for the Pi User"
x11vnc -storepasswd