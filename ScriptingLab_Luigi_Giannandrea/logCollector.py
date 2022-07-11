# Log Collector and Formatter - Lab01 - Scripting and Programming 
# SoftServe - Luigi Giannandrea - 11/07/2022
#
# Importing the modules needed to use subprocesses and input / output operations
from subprocess import Popen, PIPE, STDOUT

# Defining the command to extract the logs from the SFTP server
cmd = 'sudo docker logs SoftServeSFTP --timestamps 2>/tmp/sftptmp.log'

# Executing the command
p = Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
output = p.stdout.read()

# Opening the raw temporary log file
f = open("/tmp/sftptmp.log", "r")

# Creating the new processed log file
g = open("sftpserver.log", "w")

# Writing header to the log file
g.write("SoftServe - SFTP Server Log Reader & Formatter V1.0\n")
g.write("Lab 01 Scripting & Programming - Luigi Giannandrea\n")
g.write("Note: Only Connection and disconnection events are logged\n\n")

# Processing each line, looking for Connection Events
for x in f:
    if "Accepted publickey" in x:
        y = x.split()
        g.write("INFO: "+ x[:10]+" "+x[11:19]+ " - User "+y[4]+" Successfully Connected using SSH Key from device with IP Address "+y[6]+"\n")

# Processing each line, looking for Disconnection Events

    if "Disconnected from" in x:
        y = x.split()
        g.write("INFO: "+ x[:10]+" "+x[11:19]+ " - User "+y[4]+" has closed connection from device with IP Address "+y[5]+"\n")

# Closing the new Log File
g.close()

# Closing the temporary Log File
f.close()



