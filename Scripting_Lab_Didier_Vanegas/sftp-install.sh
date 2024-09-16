#!/bin/bash
apt-get update && apt-get install -y openssh-server
mkdir /var/run/sshd
useradd --create-home --base-dir /home ftpuser && echo "ftpuser:ftpuser" | chpasswd
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

exec "$@"