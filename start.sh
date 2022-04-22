#!/bin/bash
 
# check if Dead Switch has been setup by searching for config file emaildata.json
# if emaildata.json is not present, Dead Switch will run through the setup
clear

file=emaildata.json
if [ -f "$file" ];
then
#    echo "exists"
    sleep 1
    python3 checkdate.py
else
#    echo "not exist"
    sleep 1
    bash welcome.sh
fi
exit

 
