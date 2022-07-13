#!/bin/bash

containerport=8082

echo "Creating SFTP Dockerfile"

cat << EOF >> $PWD/Dockerfile
#Docker Image base
FROM ubuntu:16.04

LABEL maintainer="alcaraza.jose@gmail.com"

#Update and installation of necessary packages
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Password & Authentication
RUN echo 'root:crashcoursesftp22' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH & Keeping Session Alive
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
EOF

echo "Finish creating the Dockerfile"

echo "Create container image"
docker image build $PWD -t docker-sftp

echo "SFTP container creation"
docker run -d --name test-sftp -p $containerport:22 docker-sftp

echo "SFTP service creation completes successfully, the port for the connection is $containerport"
