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

