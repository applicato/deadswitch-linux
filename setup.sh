#!/bin/bash

# this is the setup script which collects all the necessary data
#------------------------------------------------------------------------PAGE1-----------------------------------------------------
resize -s 35 80
clear
echo "$(tput setaf 2)setup script..."
echo ""
echo "$(tput setaf 1)DEAD SWITCH SETUP"
echo "$(tput sgr0)$(tput setaf 5)====================="
echo ""
currentdate=$(date)
epoch=$(date +%s)
echo "$(tput setaf 3)Todays date is, $currentdate"
echo ""
echo "$(tput setaf 6)In order for Dead Switch to work, it needs to get a certain amount of data from you. This data will be used to configure the program so that it can work properly. Dead Switch will configure an SMTP server with your email settings. Please answer the following questions correctly:" | fold -sw 80
echo ""
echo "$(tput setaf 5)----------------------------"
echo "Email Setup Information"
echo "----------------------------"
echo ""
read -p "What is your email address?: " sender_email
read -p "What your email password?: " password
read -p "What is your SMTP login/username?: " smtplogin
read -p "What is your SMTP server address?: " smtpserver
read -p "What is your SMTP server StartTLS port?: " smtpport
read -p "What is the recipients email address?: " receiver_email
read -p "What is the SUBJECT of the message: " subject
read -p "Write the body of the message here. 'Enter' will end typing. " message
echo "Do you want to include an attachment to the email? yes/no: "
read yesorno
if [ "$yesorno" = yes ]; then
    read -p "Write the full path/URL (eg. /home/user/file.zip) of the file you want to attach: " attachment
    echo "xattachment $attachment" >> emaildata.txt
elif [ "$yesorno" = no ]; then
    echo "No attachment will be added"
else
    echo "Not a valid answer."
    exit 1
fi

echo ""
sleep 2
echo "$(tput setaf 2)setup script continuing..."
sleep 2
#------------------------------------------------------------------------PAGE2-----------------------------------------------------
clear
echo "$(tput setaf 2)setup script..."
echo ""
echo "$(tput setaf 1)DEAD SWITCH SETUP"
echo "$(tput sgr0)$(tput setaf 5)====================="
echo ""
echo "$(tput setaf 3)Todays date is, $currentdate"
echo ""
echo "$(tput setaf 6)This section is extrememly important. Dead Man Switch needs to obtain the interval date; this is the time between the last check-in and the next check-in. Dead Man Switch also requires a password which you will enter when prompted on the check-in date to confirm that you are indeed alive. Please think carefully about the interval date and password. Once the program is running on your computer, the only way to disable it is to delete it. If for some reason you do not check in on the specified date, the program will attempt to send the email message." | fold -sw 80
echo ""
echo "$(tput setaf 5)----------------------------"
echo "Date Setup Information"
echo "----------------------------"
echo ""
echo "What is the interval (number days) you wish to have Dead Switch check on you? (minimum 1 day): "
read interval
if ! [ "$interval" -eq "$interval" ] 2> /dev/null
then
    echo "Sorry integer numbers only"
fi

oneday=86400
result=$((oneday * interval))
intervalcheck=$((result + epoch))

read -p "Enter a password for Dead Switch: " dms_password
echo ""
sleep 2
echo "$(tput setaf 2)setup script continuing..."
sleep 2
#------------------------------------------------------------------------PAGE3-----------------------------------------------------
clear
echo "$(tput setaf 2)setup script..."
echo ""
echo "$(tput setaf 1)DEAD SWITCH SETUP"
echo "$(tput sgr0)$(tput setaf 5)====================="
echo ""
echo "$(tput setaf 3)Todays date is, $currentdate"
echo ""
echo "$(tput setaf 6)Please review the information you have entered to ensure that it is correct. A mistake could have drastic consequences regarding the interval timing and delivery of the payload/email to the intended recipients, so please check the details below for errors. If you have made a mistake, just close the terminal and run the start.sh program again." | fold -sw 80
echo ""
echo "$(tput setaf 5)----------------------------"
echo "Setup Information Review"
echo "----------------------------"
echo ""
echo "Your email address: "$sender_email
echo "Your email password: "$password
echo "Your SMTP login/username?: " $smtplogin
echo "Your SMTP server address?: " $smtpserver
echo "Your SMTP server StartTLS port?: " $smtpport
echo "The recipients email address: "$receiver_email
echo "Message subject: "$subject
echo "Message body: "$message
echo "Interval date check: "$interval 'days'
printf "Dead Switch will check on: " 
date -d @$intervalcheck
echo "Dead Man Switch password: "$dms_password
echo ""
read -p "$(tput setaf 1)Press ENTER to continue"
sleep 2
#------------------------------------------------------------------------PAGE4-----------------------------------------------------
clear
echo "$(tput setaf 2)setup script..."
echo ""
echo "$(tput setaf 1)DEAD SWITCH SETUP"
echo "$(tput sgr0)$(tput setaf 5)====================="
echo ""
echo "$(tput setaf 3)Todays date is, $currentdate"
echo ""
echo "$(tput setaf 6)Dead Switch will now write the data to disk. Once this process is complete, other calculations will take place and the program will be ready to run." | fold -sw 80
echo ""
echo "$(tput setaf 5)----------------------------"
echo "Setup Write Changes to Disk"
echo "----------------------------"
echo ""
echo "xsender_email $sender_email" >> emaildata.txt
echo "xpassword $password" >> emaildata.txt
echo "xsmtplogin $smtplogin" >> emaildata.txt
echo "xsmtpserver $smtpserver" >> emaildata.txt
echo "xsmtpport $smtpport" >> emaildata.txt
echo "xreceiver_email $receiver_email" >> emaildata.txt
echo "xsubject $subject" >> emaildata.txt
echo "xmessage $message" >> emaildata.txt
echo "xdms_password $dms_password" >> pass.txt
echo "xepoch $epoch" >> timedata.txt
echo "xinterval $interval" >> timedata.txt
echo "xintervalcheck $intervalcheck" >> timedata.txt
echo ""

for ((k = 0; k <= 10 ; k++))
do
echo -n "$(tput setaf 5)writing EMAIL data to disk $(tput setaf 7)[ "
for ((i = 0 ; i <= k; i++)); do echo -n "$(tput setaf 7)###"; done
for ((j = i ; j <= 10 ; j++)); do echo -n "   "; done
v=$((k * 10))
echo -n " ] "
echo -n "$v %" $'\r'
sleep 0.2
done
echo ""
echo ""
for ((k = 0; k <= 10 ; k++))
do
echo -n "$(tput setaf 5)writing DATE data to disk $(tput setaf 7)[ "
for ((i = 0 ; i <= k; i++)); do echo -n "$(tput setaf 7)###"; done
for ((j = i ; j <= 10 ; j++)); do echo -n "   "; done
v=$((k * 10))
echo -n " ] "
echo -n "$v %" $'\r'
sleep 0.2
done
echo ""
echo ""
read -p "$(tput setaf 1)Press ENTER to continue"
sleep 1
#------------------------------------------------------------------------CALCULATIONS----------------------------------------------
python3 convert.py
#------------------------------------------------------------------------CALCULATIONS----------------------------------------------
#------------------------------------------------------------------------PAGE5-----------------------------------------------------
sleep 1
clear
echo "$(tput setaf 2)setup script..."
echo ""
echo "$(tput setaf 1)DEAD SWITCH SETUP"
echo "$(tput sgr0)$(tput setaf 5)====================="
echo ""
echo "$(tput setaf 3)Todays date is, $currentdate"
echo ""
echo "$(tput setaf 5)----------------------------"
echo "Setup Cron Job"
echo "----------------------------"
echo ""
echo "$(tput setaf 6)There are 2 ways you can run Dead Switch automatically. The first and simplest is to add start.sh to your autostart apps. Everytime you login, Dead Switch will run the program and check. Alternatively, you can set this program to run in CRON everyday at a time that you will most likely to be at the computer. This will ensure that Dead Switch will check when you are available." | fold -sw 80
echo ""
echo "If you want to use Cron, I suggest you use Crontab, you can use the website called Crontab Guru at https://crontab.guru/ to help you configure it properly." | fold -sw 80
echo ""
echo "Only run start.sh in Autostart/Crontab. After this step in the setup, the program (start.sh) will be ready to run at the scheduled time you have selected." | fold -sw 80
echo ""
echo ""
echo "$(tput setaf 1)Thank you for using Dead Switch."
#------------------------------------------------------------------------CALCULATIONS----------------------------------------------
python3 findandreplace.py
#------------------------------------------------------------------------CALCULATIONS----------------------------------------------
echo ""
read -p "Press enter to continue"
sleep 2
#------------------------------------------------------------------------CLEANUP---------------------------------------------------
rm emaildata.txt
rm timedata.txt
rm pass.txt
rm pass.json
rm temp.txt
xxd -p "mortypad.json" > ".dapytrom"
rm mortypad.json
#------------------------------------------------------------------------CLEANUP---------------------------------------------------
exit


