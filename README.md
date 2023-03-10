# new-user-bash-script
A bash script to create a new user with a home directory and password

On a mission to learn BASH, I wrote this script. It is a program that creates a new user with a home directory and a password instead of running useradd -m and passwd commands.

This script has to be run with the sudo command by a user with admin privileges and I will continue to build it out as I learn more and more BASH. I am currently working on adding a help menu and more text instruction throughout the script. 

UPDATE: Help menu is implemented, accessible using -h, --help, or -help options

UPDATE: The password has parameters that require upper case, lower case, and numeric characters as well as a minimum length of 8 characters (which can easily be extended to increase the effectiveness of user passwords against a brute force hacking attempt).

If the password is not succesfully created, then the user and its corresponding home directory are automatically deleted and the script exits. This is to enforce the password strength parameters and avoid any stray users without passwords floating around in your system.

Hopefully, I can develop this script to the point where it is a useful tool for Linux administrators to easily create new users with home directories and passwords.

I have found Joe Collins of Ezee Linux to be a fantastic teacher of this subject https://www.youtube.com/watch?v=WCm0GuiBDKo 
He has a dedicated website beyond his youtube channel and brings a personable and welcoming element to his teachings. I highly recommend taking a look at his resources if you are looking to learn BASH and the Linux command line.  
