#!/bin/bash

#This scripts shows you basic information using echo command.
#It prints environment variables like $USER, $HOME and $SHELL, 
#and uses commands like pwd and date to show the current directory and date/time.


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

