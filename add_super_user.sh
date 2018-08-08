#!/bin/bash

#this script simply will add a user
#it will create a user and set its password and add it to the wheel group.
#user name and password will be passed through arguments
#I use it as user data when creating digital ocean droplets
#syntax doprep.sh username password
username=$1
password=$2
adduser $username 
echo $username:$password | chpasswd
usermod -aG wheel $username

#make it nopassword for sudo
echo -e "\033[32mupdate visudo to NOPASSWORD for wheel group\033[0m"
sed -i "$ a "## Next Line Added by simpledotsys" /etc/sudoers
sed -i "$ a $username ALL=(ALL)       NOPASSWD: ALL" /etc/sudoers && echo 'sudoers updated Successfully' || echo 'sudoers update failed'
