#!/bin/bash

#resets Dead Switch
resize -s 35 80
clear
rm emaildata.json
rm timedata.json
rm .dapytrom
rm mortypad.json
rm output.txt
echo "$(tput setaf 1)"
echo "██████╗ ███████╗ █████╗ ██████╗ ███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗"
echo "██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║"
echo "██║  ██║█████╗  ███████║██║  ██║███████╗██║ █╗ ██║██║   ██║   ██║     ███████║"
echo "██║  ██║██╔══╝  ██╔══██║██║  ██║╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║"
echo "██████╔╝███████╗██║  ██║██████╔╝███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║"
echo "╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝"
echo ""
echo "                  ██████╗ ███████╗███████╗███████╗████████╗"
echo "                  ██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝"
echo "                  ██████╔╝█████╗  ███████╗█████╗     ██║   "
echo "                  ██╔══██╗██╔══╝  ╚════██║██╔══╝     ██║   "
echo "                  ██║  ██║███████╗███████║███████╗   ██║   "
echo "                  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝  "
echo ""
echo "$(tput setaf 1)DEADSWITCH HAS BEEN RESET, MESSEGES AND SETTINGS HAVE BEEN ERASED"
echo ""
echo "$(tput setaf 5)If you want to setup DeadSwitch again please download output.txt file again from:" | fold -sw 80
echo ""
echo "$(tput setaf 6)GITHUB --> https://github.com/dimensionc132 DeadManSwitch repository" | fold -sw 80
echo ""
echo "or"
echo ""
echo "CODEBERG --> https://codeberg.org/dimensionc132 DeadManSwitch repository." | fold -sw 80
echo ""
echo "After you have downloaded output.txt and copied it into the Dead Switch directory, run ./start.sh" | fold -sw 80
echo ""
echo "$(tput setaf 3)Thank you for using Dead Switch. Goodbye"
sleep 30
clear
exit

