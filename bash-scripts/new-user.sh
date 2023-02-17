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
    echo "You must be have sudo privileges to run this script"
    exit
fi

#Set the username when prompted

read -p 'Username: ' uservar

#if the username is less than 6 characters, then the 
#script will exit with an error message
#and delete the user

if [ ${#uservar} -lt 6 ] ; then
    echo "Username must be at least 6 characters"
    exit
fi

#This creates the user and the user's home directory
useradd -U $uservar -m

#Set the password when prompted

read -p 'Password (must be 8+ characters and include at least one number, 
uppercase letter and lower case letter): ' passvar

#if the password is less than 8 characters, then the
#script will exit with an error message
#and delete the user

if [ ${#passvar} -lt 8 ] ; then
    echo "Password must be at least 8 characters"
    userdel -r $uservar
    exit
fi

#if the password does not contain an uppercase letter, lower case letter or a number then the
#script will exit with an error message
#and delete the user

if [[ ! $passvar =~ [A-Z] ]] ; then
    echo "Password must contain an uppercase letter"
    userdel -r $uservar
    exit
fi

#if the password does not contain a number, then the
#script will exit with an error message
#and delete the user

if [[ ! $passvar =~ [0-9] ]] ; then
    echo "Password must contain at lease one number (0-9)" 
    userdel -r $uservar
    exit
fi

#if the password does not contain a lowercase letter, then the
#script will exit with an error message
#and delete the user

if [[ ! $passvar =~ [a-z] ]] ; then
    echo "Password must contain a lowercase letter"
    userdel -r $uservar
    exit
fi

#if the password contains a space, then the
#script will exit with an error message
#and delete the user

if [[ $passvar =~ [ ] ]] ; then
    echo "Password cannot contain a space"
    userdel -r $uservar
    exit
fi

#if the script is exited before the password is created
#the user will be deleted

trap "userdel -r $uservar" EXIT


#This creates the password associated with the user
echo thePassword | passwd $uservar --stdin

exit

