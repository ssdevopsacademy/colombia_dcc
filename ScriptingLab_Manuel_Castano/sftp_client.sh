#!/bin/bash
if [[ -z "${sftppassword}" ]]; then
  echo "this script needs you to first set the (sftppassword) environment variable with the sftp server password."
else 

  if [[ -f "./storeme.txt" ]]; then
    echo "Manuel Castano Devops Crash Course" > storeme.txt
  fi

  sudo docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t sftpclient:latest . 
  clientid=$(sudo docker run --name client -d -e SSHPASS=$sftppassword -e SFTPSERVER_ADDR=172.17.0.1 -e SFTPSERVER_PORT=2222 sftpclient:latest)
  echo "$clientid" > id_container_client
fi
