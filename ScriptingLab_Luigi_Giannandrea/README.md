# Lab 01 - Scripting & Programming

The following files are the deliverables for the Laboratory 1 about scripting and programming.

## Files

**1. deploySFTP.sh** - This bash script executes all the required commands to deploy a new Docker Container. An internal Network is created for be shared between the containers. The SFTP Server will be always listen for connections on IP address 172.18.0.2.

   *Note:* Some commands for Docker installation will be executed at the beginning. SSH Keys will be generated and used to communicate between Containers (Server and Client) 

**2. Dockerfile** - This file will be used to create the custom Docker Image that runs the Cron daemon, to connect every 10 minutes to the SFTP Server. To create the Docker image, please run:
   ```bash
   sudo docker build -t softserve/sftpclient:v1 .
   ```

   Once the new Image is generated, please run the container using:
   ```bash
   sudo docker run -d --net SoftServeNetwork --ip 172.18.0.3 --name SoftServeSFTPClientCron softserve/sftpclient:v1
   ```
   Now both containers are using the same internal network and no extra parameters are required. Each 10 minutes SoftServeSFTPClientCron will connect to the SFTP Server without transfer any file.


**3. logCollector.py** - This Python script will recover the logs from the SFTP Server Container using direct connection to the Docker API. The logs are filtered and then processed to only show Connection and Disconnection events in a different and nicer way. To execute the log collector use the following syntax:

   ```bash 
   python3 logCollector.py
   ```
   After the execution you will get a new file called: **sftpserver.log**

## Additional Considerations
- To run the scripts, is better to put all the three files in the same directory, before running them.

- All the creation of files were tested on VMs and Containers based in Ubuntu:latest

## Author & Notes
Luigi Giannandrea - SoftServe DevOps Crash Course - 2022