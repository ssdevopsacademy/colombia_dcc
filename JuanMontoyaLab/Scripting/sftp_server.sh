#!/bin/bash

if ! test -f sftpKey.pub; then
    ssh-keygen  -t rsa -f sftpKey -q -N ""
fi

echo "FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y 

RUN apt install openssh-server sudo -y

RUN addgroup sftp

RUN useradd -m sftpuser -g sftp

RUN mkdir -p /home/sftpuser/.ssh

COPY sftpKey.pub /home/sftpuser/.ssh/authorized_keys

RUN chown sftpuser:sftp /home/sftpuser/.ssh/authorized_keys && chmod 700 /home/sftpuser/.ssh/authorized_keys

RUN service ssh start

EXPOSE 22

CMD [\"/usr/sbin/sshd\", \"-D\"]"> sftpserver.Dockerfile

docker build -f sftpserver.Dockerfile -t sftpserver .
docker run -d --rm --name sftpserver -p 2222:22 sftpserver
