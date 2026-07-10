#!/usr/bin/env bash

echo "Current shell: $0"
echo "BASH_VERSION: $BASH_VERSION"
command -v nvm
type nvm

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
        exit 0 
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
        exit 0 
    fi
else 

echo "The CPU usage is Optimal"

fi

echo "Checking RAM availability"

# i will put the ram availability check here to prevent the callstack exceeed issue 

# RAM_AVAILABLE=$(top -l 1 | grep -i)

# exit 0

######
#. Adding check for node existence 
######
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
else
    echo "NVM is not installed."
fi

if ! command -v nvm ; then
    echo "NVM exists"

    if command -v node &&  command -v npm > /dev/null ; then 
        echo "node and npm exist " 
    fi
else 

echo "NVM dosent exist..  "

echo "Installing NVM ......."

if ! command -v brew ; then 
    echo "brew in not installed please Insatll Homebrew"
    echo "installing Homebrew in users System"
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    echo "Homebrew installed successfully."
       else
    echo "Failed to install Homebrew."
    exit 1 
    fi
else
    echo "brew found  installed "

fi    

fi

echo "Node is Available"

read -p "Press Enter to exit..."