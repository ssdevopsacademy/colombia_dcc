#!/bin/bash
# The following script create SFTP server as Container
CONTAINER_NAME=sftpcontainer
PORT_EXTERNO=2222
PORT_INTERNO=22
VOLUMEN_PATH=$(pwd)/uploads
NET_NAME=lab01
IMAGE_SFTP_DOCKER=atmoz/sftp
USER=carga
PASS=Pruebas.123

[ ! -d "$VOLUMEN_PATH" ] && mkdir "$VOLUMEN_PATH"

if [ -d "$VOLUMEN_PATH" ] 
then
	docker network create -d bridge $NET_NAME
	docker run \
	-v "$VOLUMEN_PATH":/home/$USER/uploads \
	-p $PORT_EXTERNO:$PORT_INTERNO \
	--network $NET_NAME --log-driver json-file \
	--name $CONTAINER_NAME \
	-d --rm  ${IMAGE_SFTP_DOCKER} \
	$USER:$PASS:1001
else
	echo "*******************" && echo "Error: Directory ${VOLUMEN_PATH} does not exists."
fi
