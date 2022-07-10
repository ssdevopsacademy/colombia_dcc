#!/bin/bash/

if ! test -f sftpKey.pub; then
    yes "y" | ssh-keygen -o -a 100 -t ed25519 -C "Key for accessing Sftp" -f sftpKey -N ""
    #chmod ugo=- ./sftpKey ./sftpKey.pub
    chmod 400 ./sftpKey ./sftpKey.pub
    ls -l
 fi 

echo "FROM ubuntu:latest
RUN apt update && apt install  openssh-server sudo -y
# Create a user “sshuser” and group “sshgroup”
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser
# Create sshuser directory in home
RUN mkdir -p /home/sshuser/.ssh
# Copy the ssh public key in the authorized_keys file. 
COPY sftpKey.pub /home/sshuser/.ssh/authorized_keys
# change ownership of the key file. 
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys && chmod 400 /home/sshuser/.ssh/authorized_keys
# Start SSH service
RUN service ssh start
# Expose docker port 22
EXPOSE 22
CMD [\"/usr/sbin/sshd\", \"-D\"]" > Dockerfile.bash

docker build -t sftp-bash -f Dockerfile.bash .

docker run -d -p 32768:22 --name sftp-bash sftp-bash
ssh -i sftpKey sshuser@localhost -p 32768
