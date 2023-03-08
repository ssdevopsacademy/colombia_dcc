# Dockerfile - Lab01 - Scripting and Programming - SoftServe - Luigi Giannandrea
# 11/07/2022
# This image will be based in Ubuntu Linux Distribution
FROM ubuntu:latest
MAINTAINER luigi.giannandrea@gmail.com
# Adding the SSH User Private Keys to be able to connect to the SFTP Server without password
ADD ssh_host_ed25519_key /root/ssh_host_ed25519_key
ADD ssh_host_rsa_key /root/ssh_host_rsa_key
# Securing the keys to only access for the owner
RUN chmod 700 /root/ssh_host_ed25519_key
RUN chmod 700 /root/ssh_host_rsa_key
# Updating the repository and Installing Cron and other utilities.
RUN apt-get update
RUN apt-get -y install cron vim openssh-client
# Creating a Script for be executed by cron
RUN echo "#!/bin/bash" >> /root/sftpClientScript.sh
RUN echo "sftp -P 22 -i /root/ssh_host_ed25519_key -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null foo@172.18.0.2 <<< 'quit'" >> /root/sftpClientScript.sh
RUN chmod 755 /root/sftpClientScript.sh
# Adding the required line to the crontab to execute the script each 10 Minutes
RUN crontab -l | { cat; echo "*/10 * * * * bash /root/sftpClientScript.sh"; } | crontab -
# Adding the entry point command to execute the Cron program
ENTRYPOINT ["cron", "-f"]