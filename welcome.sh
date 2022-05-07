#!/bin/bash

resize -s 35 80
clear
echo "$(tput setaf 1)"
echo "██████╗ ███████╗ █████╗ ██████╗ ███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗"
echo "██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║"
echo "██║  ██║█████╗  ███████║██║  ██║███████╗██║ █╗ ██║██║   ██║   ██║     ███████║"
echo "██║  ██║██╔══╝  ██╔══██║██║  ██║╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║"
echo "██████╔╝███████╗██║  ██║██████╔╝███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║"
echo "╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝"
echo ""
echo "$(tput setaf 6)A dead man switch is a mechanism (digital or physical) that triggers when the user fails to perform an action. In the scope of this function, Dead Switch is a security application designed protect your data/secrets in case you are threatened by violence from people, organizations or government agencies or simply as a safeguard for your data/secrets in case something unforseen happens to you. If such a scenario were to occur, an email will be sent with your data/secrets to a specified person for safekeeping." | fold -sw 80
echo ""
echo "The most famous use of a Dead Man Switch in recent times was by Edward Snowden who distributed encrypted copies of his secret documents to various trusted people, and then setup a Dead Man Switch to email the encryption key." | fold -sw 80
echo ""
echo "Dead Switch will help you create an email message to which you can add an optional attachment that will be sent to a specified email address. If you fail to check-in after a specified interval, Dead Switch assumes that you no longer have to access this computer or that you have been 'incapacited' and will then send the email with optional attachment." | fold -sw 80
echo ""
echo "$(tput setaf 1)Do you wish to continue and run Dead Switch setup? [Y,N]"
read input
if [[ $input == "Y" || $input == "y" ]]; 
    then
        bash setup.sh
    else
        echo "Exiting Dead Switch program. Goodbye"
    fi
