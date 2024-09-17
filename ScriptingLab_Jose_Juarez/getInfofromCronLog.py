import os

cronLogFileName = "cron.log"
bashDockerCommand = f"docker cp sftp-docker:{cronLogFileName} ."
textToFindIntoCronLogFile = "Last login:"
sshUser = "sshuser "
pythonLogFileName = "python.log"
pythonLogFileContent = ""

#copy cronLogFileName from docker container into host current directory
os.system(bashDockerCommand)

#search for textToFindIntoFile  
with open(f"{cronLogFileName}", "r") as fp:
    lines = fp.readlines()
    for line in lines:
        if line.find(textToFindIntoCronLogFile) != -1:
            pythonLogFileContent = pythonLogFileContent + sshUser + line

#create python log file
text_file = open(f"{pythonLogFileName}", "w")
text_file.write(pythonLogFileContent)
text_file.close()