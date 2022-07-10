#! /usr/bin/python
import sys
print("Goodbye from ")
f = open("log/python.log", "w")
with open("log/cron.log",'r') as data_file:
    for line in data_file:
	if "Crontab" in line:
	    print(line)
	else:
	    f.write(line)

f.close()
