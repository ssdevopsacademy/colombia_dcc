#!/bin/bash
set -euo pipefail

docker="
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server \
   postgresql-client \
   language-pack-ja

RUN update-locale LANG=ja_JP.UTF-8

RUN mkdir /var/run/sshd

RUN echo root:123456 | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE \"in users profile\"
RUN echo \"export VISIBLE=now\" >> /etc/profile

EXPOSE 22
CMD [\"/usr/sbin/sshd\", \"-D\"]
"
echo "$docker" > ./Dockerfile

docker build -t sftp_server . && docker run -d sftp_server





