import os
import sys
import json
import time
import subprocess
from datetime import date, timedelta
from subprocess import call

# check if the date today is the interval check date

#----calculate epoch time today------
now = int( time.time() )

#----read interval check date------
fileObject = open("timedata.json", "r")
jsonContent = fileObject.read()
timedatedata = json.loads(jsonContent)
intervalcheck_str = timedatedata['xintervalcheck']
intervalcheck = int(intervalcheck_str)

#----compare dates-----
a = now
b = intervalcheck

print("today", a)
print("date check", b)

if a < b:
	print("No check-in today....")
if a >= b:
	print("Check-in today. Dead Switch will check the password....")
	os.system('sh checkpass.sh')




