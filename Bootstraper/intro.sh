#!/usr/bin/env bash

echo "Welcome To Rishabh Bootstraper"
if ping -c 1 google.com ; then
    echo "internet is reachable"
else 
    echo "Internet Connection Not Available"
    exit 1
fi        

AVAILABLE_SPACE=$(df -g / | tail -1 | awk '{print $4}')

if [ ! "$AVAILABLE_SPACE" -le 1 ]; then

echo "Storage Disk Has Less then 1 Gb Required Space , Do you still want to continue";

read -p "Do you still want to continue(yes/no): " User_Choice

# FIX: Added brackets, the '$' sign, and double quotes
    if [ "$User_Choice" == "n" ] || [ "$User_Choice" == "no" ]; then 
        echo "well done boy good luck you cant take risk "
        read -p "press enter to exit"
        exit 1
    else 
        echo "good job"
        # exit 0 # You probably want to stop the script if they don't say yes!
    fi
else

echo "Required Disk Space Available "
fi 

CPU_Usage=$(top -l 1 | grep -i "CPU usage" | awk '{print $3}' | sed s/%// | cut -d. 
-f1)

if [ ! "$CPU_Usage" -le 85] ; then

echo "WARNING: CPU usage is at ${CPU_USAGE}%, which is higher than the recommended 85%!"

read -p "Do you still want to continue(yes/no): " User_Choice

     if [ "$User_Choice" == "n" ] || [ "$User_Choice" == "no" ]; then 
        echo "well done boy good luck you cant take risk "
        read -p "press enter to exit"
        exit 1
    else 
        echo "good job"
        exit 0 # You probably want to stop the script if they don't say yes!
    fi
else 

echo "The CPU usage is Optimal"

fi

exit 0

read -p "Press Enter to exit..."