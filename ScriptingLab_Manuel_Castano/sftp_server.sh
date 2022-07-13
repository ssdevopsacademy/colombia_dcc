#!/bin/bash
if [[ -z "${sftppassword}" ]]; then
  echo "what will be the password of the sftp server?"
  read -s password
  export sftppassword="$password"
fi

containerid=$(sudo docker run --name server -p 2222:22 -d atmoz/sftp:latest sftpuser:$sftppassword:::upload)
echo "$containerid" > id_container_server
