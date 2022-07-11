# Scripting Laboratory

## How to run the lab

### 1. Create the sftp server

First, create the docker container that contains the sftp server with bash script as follows:

    $ ./sftp_server.sh

If you want to check if the server was created successfully, run the following command and enter `SFTP` in the field `Enter passphrase for key 'sftpKey'`:

    $ ssh -i sftpKey sftpuser@localhost -p 2222

### 2. Create the crontab container