import os
import sys
import subprocess
import json
import random
import secrets
import fileinput
import linecache
import getpass
import base64

#get random line number and word from output.txt file between 1 and 24017 EOF
random_number = secrets.randbelow(24017)
with open("output.txt", "r") as fp:
   line = fp.readlines()
random_word = line[random_number]
fp.close()

#save random line = line number
linenumber = random_number +1
rando = {"zahl":linenumber}
with open('mortypad.json', 'w') as jsonfile:
	json.dump(rando, jsonfile)
jsonfile.close()

#save random word at random line in temp file ONLY FOR CHECKING __ NeED TO DELETE
fin = open('temp.txt', "w")
fin.write(random_word)
fin.close()

fileObject = open("mortypad.json", "r")
jsonContent = fileObject.read()
linedata = json.loads(jsonContent)
linenumber = linedata['zahl']

fileObject = open("pass.json", "r")
jsonContent = fileObject.read()
passdata = json.loads(jsonContent)
linepass = passdata['xdms_password']

with open('temp.txt') as f:
    firstline = f.readlines()[0].rstrip()
f.close()

fileObject = open("pass.json", "r")
jsonContent = fileObject.read()
passdata = json.loads(jsonContent)
linepass = passdata['xdms_password']

#replace the word with the pwd
old = firstline
new = linepass
for line in fileinput.input("output.txt", inplace=1):
	line = line.replace(old, new)
	sys.stdout.write(line)
