#!/bin/bash

xxd -r -p ".dapytrom" > "mortypad.json"
python3 checkin.py
xxd -p "mortypad.json" > ".dapytrom"
rm mortypad.json
sleep 4
clear
exit














