#/bin/bash/!
#ajaxx . delete-button
#version 1.5, trying to add in error handling and upgrading its capabilites 
makesshkey(){
    echo "Hit enter when Prompted"
    ssh-keygen -b 2048 -t rsa -f $1
}
getsshkey(){
    cat ~/.ssh/$1
}
deletesshkey(){
    rm ~/.ssh/$1
}
makescript(){
    echo "Enter the Pi's Hostname"
    read hostname
    if ping -c 1 $hostname; then
        echo "yeehaw"
        makesshkey $hostname
}
configurescript(){

}
deletescript(){

}