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
import time
import datetime
from datetime import date, timedelta
from datetime import datetime

today = date.today()

def nextinterval():
    now = int( time.time() )
    
    #----read interval date------
    fileObject = open("timedata.json", "r")
    jsonContent = fileObject.read()
    timedatedata = json.loads(jsonContent)
    interval_str = timedatedata['xinterval']
    interval = int(interval_str)
    
    datecheck = int(now + (interval * 86400))
    
    timedata = {"xepoch":now, "xinterval":interval, "xintervalcheck":datecheck}
    out_file = open("timedata.json", "w")
    json.dump(timedata, out_file)
    out_file.close()
    
    print("Interval from file", interval)
    print("Epoch today", now)
    print("next interval is on", datecheck)
    time.sleep(2)

#------------------------------------------------------------------------------1
sys.stdout.write("\x1b[8;{rows};{cols}t".format(rows=25, cols=80))			
os.system('cls' if os.name == 'nt' else 'clear')							
list_dir = subprocess.Popen(["notify-send", "'Dead Switch Check-in'"])
list_dir.wait()
os.system("tput setaf 2")
print("start check-in script...\n")
os.system("tput setaf 1")
print("DEAD SWITCH CHECK-IN")
os.system("tput setaf 5")
print("=====================\n")
os.system("tput setaf 3")
print("Todays date is", today)
print("")

fileObject = open("mortypad.json", "r")
jsonContent = fileObject.read()
linedata = json.loads(jsonContent)
linenumber = linedata['zahl']

output_number = linenumber

#open output.txt and read password
output_re = linecache.getline('output.txt', output_number)
output_read = output_re.strip()
b = output_read

count = 0
while (count < 3):
    os.system("tput setaf 5")
    pwd = getpass.getpass(prompt = 'Enter the Dead Switch password: ')

    a = pwd

    othera = base64.encodebytes(a.encode())
    otherb = base64.encodebytes(b.encode())

    if othera == otherb:
	    print("Passwords match. See you soon.")
	    nextinterval()
	    exit()
    elif othera != otherb:
	    print("Passwords do not match. Try again.")
	    print("")
    count = count +1

print("Failed to verify Dead Switch. Email will be sent now.")
time.sleep(3)
exec(open("emailsend.py").read())
