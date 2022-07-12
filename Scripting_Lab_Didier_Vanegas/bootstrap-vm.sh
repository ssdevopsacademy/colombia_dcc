#!/bin/bash
echo "Bootstrapping"
sudo apt-get update
sudo apt-get --yes install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get -o Acquire::ForceIPv4=true --yes install docker-ce
cd /vagrant
sudo docker build -t dv/sftp -f sftp.Dockerfile .
sudo docker run --name lab-sftp -d -p 32768:22 dv/sftp
sudo docker build -t dv/client -f client.Dockerfile .
sudo docker run --name lab-client -d dv/client
#docker network create -d bridge --subnet 172.25.0.0/16 mynetwork
#docker network connect mynetwork lab-sftp
#docker network connect mynetwork lab-client