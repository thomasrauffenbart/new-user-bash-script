#!/bin/bash
#Author: Thomas Rauffenbart

#This script creates a new user 
#and password for the user based on the date

#Only users with sudo privileges can create
#new user accounts

#Set the username when prompted

read -p 'Username: ' uservar

#This creates the user and the user's home directory
useradd -U $uservar -m

#Set the password when prompted

read -p 'Password: ' passvar

#This creates the password associated with the user
echo thePassword | passwd $uservar --stdin

exit

#The Help menu
if [ $1 == "-h" || $1== "--help" || $1== '-help' ] ; then
    echo "Usage: `basename $0` [-h]"
    exit 0
fi

    cat << EOF_
new user is a tool that can ease the process of creating 
new users with home directories and passwords for 
them. 

By Thomas Rauffenbart www.thomasrauffenbartresume.com
_EOF_
}



