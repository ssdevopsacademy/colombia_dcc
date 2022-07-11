#! /bin/bash
echo "FROM atmoz/sftp:alpine

EXPOSE 22" > Dockerfile
docker build -t sftpserver1 .
docker run --name sftpserver1 \
    -v /mnt/c/Users/juang/OneDrive/Documentos/Softserve-DevOps-Crash-Course/lab-script-and-program:/home/foo/upload \
    -p 2222:22 -d sftpserver1 \
    foo:pass:1001