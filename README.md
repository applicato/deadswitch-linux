# Dead Switch
## A Dead Man Switch for Linux

![platform](https://img.shields.io/badge/platform-linux--64-lightgrey) ![passing](https://img.shields.io/badge/cli-passing-brightgreen) ![python](https://img.shields.io/badge/php-%3E%3D3.8-blue)

A Dead Man Switch (DMS) is a mechanism (digital or physical) that triggers when the user fails to perform an action.

Dead Switch is a security application designed protect your data in case you are threatened by violence from people, organizations, government agencies. or you just want to have a secure way to send data in case something unexpected happens to you. It is a safeguard for your data, that if such a scenario were to occur, an email will be sent with your data to a specified person/s for safekeeping. 

The most famous use of a Dead Man Switch in recent times was by Edward Snowden who distributed encrypted copies of his secret documents to various trusted people, and then setup a Dead Man Switch to email the encryption key if anything happened to him.

Dead Switch will check-in at a specified interval chosen by you, whether you still have access to the machine. If you fail to check-in with the correct password, the email will be sent.

## Features

- user friendly terminal setup
- written in Bash and Python
- attach a file to your email
- location agnostic; all files contained in one folder
- simple to setup and use

## Use Cases

In almost all of these use cases, some hypothetical, the main impetus to use an application such as Dead Switch is if your life is somehow in danger and you need to be able to send out a last message to either family or other important people. 

- you can write an addendum to your last will and testament and include bank accounts, real estate or if you have crypto, your private keys to your wallets
- if you are terminally ill and want to ensure that a last personalized letter is sent out
- you are going travelling and want to ensure that your location is sent if you do not return by a specified date
- you are afraid of some nefarious people and are using this email/attachment as a guarantee to 'stay alive'
- sending an encryption key to a trusted person who has a copy of your data in case something happens to you
- a safeguard for your personal assets, whose details are sent to a trusted person, in case something happens to you
- a journalist who is writing a story for publication but that publication could endanger your life, you can set your Dead Switch to publish the report if something happens to you
- just for fun you just want to play with it
- other reasons not stated here

## Installation

Dead Switch requires [Python](https://www.python.org/) v3.8+ to run which should come pre-installed on the latest version of Debian based distros such as Ubuntu and Arch based distros, but check. if not, install. The app also BASH, I coded this with GNU bash, version 5.1.4(1) but I think it would work with lesser versions as well as other shells like ZSH. 

There are no other known dependencies for this program. 

Unpack the files into any folder. Give all the files Read, Write, Execute permissions and run ./start.sh to start the setup. After the setup process has finished, you will need to have start.sh run automatically, either by using Cron or with Startup Applications. My personal way, is I have an init.sh script in Startup Apps, which opens xterm running the start.sh script. 

## Get the Latest Release

Download the [latest release](https://github.com/dimensionc132/deadswitch/releases)

## Setup

One thing to note during the setup process. You will be asked if you want to add an attachment to your email. If you choose YES, and you enter the URL of the file eg: /home/john/file.zip be sure to write in your email message that you have added an attachment as well as the name and file type. For some reason, the attachment name and type is stripped by the Python MIMEmultipart code and thus unidentifiable, but the integrity of the file is not compromised. So write that you have attached file.zip and that after your recipient downloads it, to rename it as file.zip.

## Reset

There is a file called reset.sh which does exactly as its name implies; it resets Dead Switch back to default. You can use this anytime, in case you make a mistake during the setup or for another reason. If you have run Dead Switch setup once, you will need to download or copy, the output.txt file from the repo and place it in the Dead Switch folder, this is because the output.txt file has been compromized during the setup process. 

Reset will also be called after the email message has been sent in the even of Dead Switch being triggered.

## Note: Dead Switch is a work in progress. Check for updated versions

This project is a work in progress and may not work correctly (if at all). It is made available for those who would like to try it anwyay. Please report any issues in the [issue
tracker](https://github.com/dimensionc132/deadswitch/issues).

## License

GPL v3

You may copy, distribute and modify the software as long as you track changes/dates in source files. Any modifications to or software including (via compiler) GPL-licensed code must also be made available under the GPL along with build & install instructions.

## Screenshots

![Welcome Screen](https://raw.githubusercontent.com/dimensionc132/images/main/1.jpg)

![Setup Screen](https://raw.githubusercontent.com/dimensionc132/images/main/2.jpg)

![Setup Screen](https://raw.githubusercontent.com/dimensionc132/images/main/3.jpg)

![Setup Screen](https://raw.githubusercontent.com/dimensionc132/images/main/4.jpg)

