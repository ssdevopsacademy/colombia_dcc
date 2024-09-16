import os

# extract cron log file from container (docker cp [containerID or name]:/var/log/cron.log .)
os.system("docker cp reverent_aryabhata:/var/log/cron.log .")

mylines = []
logs = []                              # Declare an empty list
with open ('cron.log', 'rt') as myfile:  # Open file lorem.txt
    for line in myfile:                   # For each line of text,
        mylines.append(line)              # add that line to the list.
    for element in mylines:               # For each element in the list,
        if element.find("Welcome to Ubuntu") != -1:
            logs.append(element)

#create a file a insert logs
with open('./logs.txt', 'w') as f:
    for log in logs:
        f.write("%s\n" % log)
