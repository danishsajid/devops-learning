#!/bin/bash
set -e

#=========================================================
#Script name: user-info.sh
#Description: This script prints basic user information using
#	      environment variables and shell commands.
#Author: Danish Sajid
#Date: July 7th 2025
#Usage: ./user-info.sh
#=========================================================
#This script shows:
#- Username from $USER
#- Home directory from $HOME
#- Shell info from $SHELL
#- Current working directory using pwd
#- Current date and time using date
#- Prints the output using echo
#==========================================================

#Print Username
echo "Username: $USER"

#Print Home directory
echo "Home Directory: $HOME"

#Print Shell
echo "Shell: $SHELL"

#Print current directory
echo "Current Directory: $(pwd)"

#Print Date and time
echo "Date & Time: $(date)"

