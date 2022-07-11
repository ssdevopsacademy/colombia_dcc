#!/bin/bash
# Deploy SFTP Script - Lab01 - Scripting and Programming - SoftServe - Luigi Giannandrea
# 11/07/2022
# 
# Running instalation of certificates to add the Docker repo.
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Updating the package manager after adding the new repos
sudo apt update
# Installing docker and related utilities
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Cleaning Just in case a previous run of container / networks with the same name occurred
sudo docker stop SoftServeSFTP > /dev/null 2>&1
sudo docker rm SoftServeSFTP > /dev/null 2>&1
sudo docker network rm SoftServeNetwork > /dev/null 2>&1
rm ssh_host_* > /dev/null 2>&1

# Creating SSH Keys to be shared between the two containers
ssh-keygen -q -N '' -t ed25519 -f ssh_host_ed25519_key >/dev/null
ssh-keygen -q -N '' -t rsa -b 4096 -f ssh_host_rsa_key >/dev/null

# Create a Shared Network for Containers
sudo docker network create --subnet=172.18.0.0/16 SoftServeNetwork

# Creating the SFTP server with a fixed IP - 172.18.0.2
sudo docker run \
    -v $PWD/ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key \
    -v $PWD/ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key \
    -v $PWD/ssh_host_ed25519_key.pub:/home/foo/.ssh/keys/ssh_host_ed25519_key.pub:ro \
    -v $PWD/ssh_host_rsa_key.pub:/home/foo/.ssh/keys/ssh_host_rsa_key.pub:ro \
    -v $PWD/share:/home/foo/share \
    --net SoftServeNetwork --ip 172.18.0.2 -p 2222:22 --name SoftServeSFTP -d atmoz/sftp \
    foo::1001