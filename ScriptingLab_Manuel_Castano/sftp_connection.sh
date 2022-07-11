#!/bin/bash
# to have the SSHPASS environment variable that comes from the docker run...
if [[ -z "${SSHPASS}" ]]; then
  scriptPath=$(dirname "$(readlink -f "$0")")
  source "${scriptPath}/.env.sh"
fi

if [[ -z "${SSHPASS}" ]]; then
  logtime=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
  echo "$logtime missing sftp password in SSHPASS env variable"
else

  if [[ -z "${SFTPSERVER_ADDR}" ]]; then
    SFTPSERVER_ADDR="172.17.0.1"
  fi

  if [[ -z "${SFTPSERVER_PORT}" ]]; then
    SFTPSERVER_PORT="22"
  fi

logtime=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
echo "$logtime"

# -e to read the password from the environment variable SSHPASS
sshpass -e sftp -oBatchMode=no -oPort=$SFTPSERVER_PORT -o StrictHostKeyChecking=no -b - sftpuser@$SFTPSERVER_ADDR << !
  cd upload
  put storeme.txt
  bye
!
fi 
