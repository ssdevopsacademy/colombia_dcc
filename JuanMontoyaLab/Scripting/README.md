# Scripting Laboratory

## How to run the lab

### 1. Create the sftp server

First, create the docker container that contains the sftp server with bash script as follows:

    $ ./sftp_server.sh

If you want to check if the server was created successfully run the following command:

    $ ssh -i sftpKey sftpuser@localhost -p 2222

### 2. Create the crontab container

Then, create the second container with `croncont.sh` bash script as follows:

    $ ./croncont.sh

This file only contains the command for build and run the docker container that contains the crontab command as specified in the `Dockerfile`. If you are having trouble with the connection between the containers you should check the IP address of the sftp server with command:

    $ docker network inspect bridge

and search for the container named `sftpserver` copy the IP address and then paste it into the `connection.sh` file as follows:

    ssh -tt -o StrictHostKeyChecking=no -i /sftpKey sftpuser@<new ip address> -p 22

**NOTE:** If you want to avoid this problem you can create a network and add the two containers to that docker network.

### 3. Run python script
For running the python script, type the following command in your terminal:

    py get_logs.py

You should get a file named `ssh.log` which contains all the logs to the sftp server until the moment you run the file.