#!/bin/bash

echo "Creating client Dockerfile"

cat << EOF >> $PWD/Dockerfile
#Docker Image base
FROM python:3.9.0b4-alpine3.12

LABEL maintainer="alcaraza.jose@gmail.com"

#Copy necessary files
COPY connectionsftp /bin/connectionsftp
COPY root /var/spool/cron/crontabs/root

#Add execution permision
RUN chmod +x /bin/connectionsftp

#Install PIP
RUN python -m pip install --upgrade pip
RUN python -m venv env
RUN source env/bin/activate
RUN pip install paramiko

CMD crond -l 2 -f
EOF

echo "Finish creating the Dockerfile"

echo "Create container image"
docker image build $PWD -t docker-client

echo "Client container creation"
docker run -d --name test-client  docker-client

echo "Client to connect to SFTP service creation completes successfully"
