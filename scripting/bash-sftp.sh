#! /bin/bash
echo 'Lanzar un servidor Sftp en docker'

docker run -d  -v sftp:/home/jhon/upload  -p 2222:22 atmoz/sftp  jhon:secret:1001
echo 'Conectarse usando el usuario jhon y password secret'

echo 