#!/bin/bash

docker build -t devopstest . & image_id=$!
wait $image_id

docker run --name containerdevops -d -p 22:22 devopstest:latest & container_id=$!
echo 'Docker deploy, ProccessID: ',$container_id


