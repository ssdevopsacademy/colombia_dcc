# Scripting Laboratory

## How to run the lab

### 1. Create the sftp server

First, create the docker container that contains the sftp server with bash script as follows:

    $ ./sftp_server.sh

If you want to check if the server was created successfully, run the following command and enter `SFTP` in the field `Enter passphrase for key 'sftpKey'`:

    $ ssh -i sftpKey sftpuser@localhost -p 2222

### 2. Create the crontab container

@REM 10 * * * * ssh -o StrictHostKeyChecking=no -i sftpKey sftpuser@172.17.0.2 -p 22 >> /var/log/cron.log  2>&1