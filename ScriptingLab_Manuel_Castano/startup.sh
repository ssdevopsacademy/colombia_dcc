#!/bin/bash
echo "what will be the password of the sftp server?"
read -s password

export sftppassword="$password"

./sftp_server.sh
./sftp_client.sh
