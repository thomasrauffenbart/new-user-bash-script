#!/bin/bash
#Author: Thomas Rauffenbart

#This script creates a new user 
#and password for the user based on the date

#Only users with sudo privileges can create
#new user accounts


#The Help menu
#This is the help menu that will display when the user
#types -h or --help or -help
#The help menu will display the purpose of the script
#and the author's name and website

if [ "$1" == "-h" -o "$1" == "--help" -o "$1" == '-help' ] ; then
    cat << EOF_

New user is a tool that can ease the process of creating 
new users along with home directories and passwords for 
your new user.

New user is a tool that can be used by anyone who has
sudo privileges.

By Thomas Rauffenbart www.thomasrauffenbartresume.com
EOF_
    exit
fi 

#This checks to see if the user is root
#If the user is not root, the script will exit

if [ $(id -u) -ne 0 ] ; then
    echo "You must be root to run this script"
    exit
fi

#Set the username when prompted

read -p 'Username: ' uservar

#if there is a syntax error, the script will exit
if [ -z "$uservar" ] ; then
    echo "You must enter a username"
    
fi

#This creates the user and the user's home directory
useradd -U $uservar -m

#Set the password when prompted

read -p 'Password: ' passvar

#This creates the password associated with the user
echo thePassword | passwd $uservar --stdin

exit





