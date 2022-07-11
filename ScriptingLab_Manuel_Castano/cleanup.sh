#!/bin/bash
if [[ -f "./id_container_server" ]]; then
  containerid=$(cat id_container_server)
  sudo docker stop $containerid
  sudo docker rm $containerid
  sudo docker image rm atmoz/sftp
  rm -rf ./id_container_server
fi

if [[ -f "./id_container_client" ]]; then
  clientid=$(cat id_container_client)
  sudo docker stop $clientid
  sudo docker rm $clientid
  sudo docker image rm sftpclient
  sudo docker image rm ubuntu:latest
  rm -rf ./id_container_client
fi
