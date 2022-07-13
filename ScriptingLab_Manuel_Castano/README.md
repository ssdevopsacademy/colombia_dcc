Malcak (Manuel)             |  SoftServe
:-------------------------:|:-------------------------:
<img src="https://avatars.githubusercontent.com/u/59063272?v=4" width="100" height="100" alt="Malcak GitHub Avatar">  |  ![SoftServe](https://media-exp2.licdn.com/dms/image/C4E0BAQEhqEYDn2-LkA/company-logo_100_100/0/1580391093627?e=1663200000&v=beta&t=EO7vueG3ailmZ1RfTbu4knkfQGiqf5LZa1RJ90nt5do)

# Scripting and Programming Lab
In this directory you will find my attempted solution to the scripting and programming lab challenge.

> before executing any script better read first the following section `how it works?`.

the requirements are:
  - Deploy SFTP server by Bash in docker. This task is done with the script `sftp_server.sh`.
  - Deploy docker with Cron (connection to sftp every 10 minutes). This task is done with the file `Dockerfile`.
  - Separate all logs from connection and store them to a log file. This task is done with the file `log_saver.py`.

## How it works?
Although you could run every script mentioned above and build the docker image, a better option is to run the script `startup.sh` script which makes it easier to run all the scripts so that everything works correctly.

> there is also a `cleanup.sh` script that helps to disassemble and clean everything mounted by these scripts, you can comment out in the script the things you don't want the script to delete, such as the ubuntu image or whatever you want.

First, make sure that the scripts: `startup.sh`, `cleanup.sh`, `sftp_server.sh`, `sftp_client.sh`, `sftp_connection.sh`, `entry.sh`, `log_saver.py`, have execution permissions.

When you run them they will ask for administrator permissions but it is only to run docker commands, you can check it in the code if you want.

let's see what each script/file does:

### `startup.sh`
this script will only ask you to enter a password for the sftp server and will execute the `sftp_server.sh` and `sftp_client.sh` scripts.

### `sftp_server.sh`
this script will raise a sftp server with docker, using the `atmoz/sftp` image, setting `sftpuser` as the user and exposing the service on port 2222 (local machine) or 22 (container). If the server password was not previously set by the `startup.sh` script, this script will ask for it. Additionally `id_container_server` file is created with the container identifier but this is only to facilitate the removal of the container in the `cleanup.sh` scrip.

### `Dockerfile`
this file details the construction of the sftpclient image, the details are in the same file, just clarify that for the construction of the image is made using `entry.sh` script as entrypoint (or CMD in this case).
```sh
# entry.sh
scriptPath=$(dirname "$(readlink -f "$0")")
printenv | sed 's/^\(.*\)$/export \1/g' > ${scriptPath}/.env.sh
chmod +x ${scriptPath}/.env.sh
cron -f
```
This script may look a bit strange but it is necessary because by default the cron daemon has the minimum environment to run, without the variables you set with docker, this is a problem for the `SSHPASS` environment variable with which you establish connection to the sftp server with the `sftp_connection.sh` script.
This script extracts the environment when running a container based on the `sftpclient` image, and saves it in the `.env.sh` file, and then it is run from the crontab to set the environment in the cron task.

> to run a container you have to set the `SSHPASS` environment variable and optionally set the `SFTPSERVER_ADDR` and `SFTPSERVER_PORT` variables. 

Example: 
```sh
# to build it
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t sftpclient:latest .
```
```sh
# to run it
docker run --name mysftpclient -d -e SSHPASS=s0m3P4ss -e SFTPSERVER_ADDR=172.17.0.1 -e SFTPSERVER_PORT=2222 sftpclient:latest
```

> an improvement of this dockerfile is that you could create a user so that the container does not run as root user. I do not do it now because I am short of time.

### `sftp_connection.sh`
This script only uses the sftp server password (which should be in the `SSHPASS` variable) to make a connection and put the `storeme.txt` file in it. This connection is made through the network `bridge`, the default network of docker, and launches the connection against the address provided by the environment variable `SFTPSERVER_ADDR` and the port provided by the environment variable `SFTPSERVER_PORT`, if these variables are not set, the requests are launched against the address `172.17.0.1` port `22`, which by default is the address of the host in the network bridge and default port for ssh service.

### `sftp_client.sh`
this script automates the process of building the `sftpclient` image and running it using a password set by `starup.sh` (or by yourself), setting the sftp server address to `172.17.0.1` with port `2222` (the same as the one the server binds to in the `sftp_server.sh` script). Additionally `id_container_client` file is created with the container identifier but this is only to facilitate the removal of the container in the `cleanup.sh` scrip.

### `cleanup.sh`
this script shuts down and removes the containers, images and files to leave everything as it was in the initial state. Only use it if you used the `starup.sh` script or if it fits with your state.

### `log_saver.py`
this python script saves the logs of both the server and the sftp client mentioned above, and stores them in the files `server.log` and `client.log`. To run it is to have 2 containers up, one with the server and one with the client, both containers must have a name, then run the following command: `log_saver.py -s server -c client`, where the `-s` parameter is the name of the server and the `-c` parameter is the name of the client.

>this script by default overwrites the contents of the `server.log` and `client.log` files every time it is run. this is not optimal but I can't improve it at the moment because I am short of time.
