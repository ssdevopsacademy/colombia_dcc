
# Scripting and Programming Laboratory Homework


## Tasks

| # | Task | Deliverable | Path |
| - | ---- | ---- | ---- |
| 1 | Deploy SFTP server by Bash in docker | Bash Script | ./task1/createContainerSFTP.sh |
| 2 | Deploy docker with Cron (connection to sftp every 10 minutes) | Dockerfile | ./task2/Dockerfile |
| 3 | Separate all logs from connection and store them to a log file | Python Script | ./task3/monitoringLogSftp.py |

## Commands

Execute task1

```bash
  cd task1
  chmod 755 createContainerSFTP.sh
  ./createContainerSFTP.sh
```
    
Execute task2

```bash
  cd task2
  docker build -t image-cron-client-sftp .
  docker run -d --rm -e SERVER_NAME=sftpcontainer -e USER=carga -e SSHPASS=Pruebas.123  --name cron-client-sftp --network lab01 image-cron-client-sftp
  docker exec -it cron-client-sftp bash
```   
Execute task3
```bash
  cd task3
  python3 monitoringLogSftp.py
``` 

Clean enviroment
```bash
docker stop cron-client-sftp
docker stop sftpcontainer
``` 

## Authors

- [@cecasta](https://github.com/cecasta)

