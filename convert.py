import os
import sys
import json

# converting text files to json
#-------------------------------------convert emaildata.txt to emaildata.json
dict1dict1 = {}

with open('emaildata.txt') as fh:

	for line in fh:

		# reads each line and trims of extra the spaces
		# and gives only the valid words
		command, description = line.strip().split(None, 1)

		dict1dict1[command] = description.strip()

# creating json file
out_file = open("emaildata.json", "w")
json.dump(dict1dict1, out_file, indent = 4, sort_keys = False)
out_file.close()

#----------------------------------------convert timedata.txt to timedata.json
dict1 = {}

# creating dictionary
with open('timedata.txt') as fh:

	for line in fh:

		# reads each line and trims of extra the spaces
		# and gives only the valid words
		command, description = line.strip().split(None, 1)

		dict1[command] = description.strip()

# creating json file
new_file = open("timedata.json", "w")
json.dump(dict1, new_file, indent = 4, sort_keys = False)
new_file.close()

#----------------------------------------convert pass.txt to pass.json
dict1dict1dict1 = {}

# creating dictionary
with open('pass.txt') as fh:

	for line in fh:

		# reads each line and trims of extra the spaces
		# and gives only the valid words
		command, description = line.strip().split(None, 1)

		dict1dict1dict1[command] = description.strip()

# creating json file
newnew_file = open("pass.json", "w")
json.dump(dict1dict1dict1, newnew_file, indent = 4, sort_keys = False)
newnew_file.close()
