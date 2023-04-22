#From dockerhub
#To create a directory

mkdir -p sftp

#To mount a directory and set UID:

sudo docker run  -v sftp:/home/user1/upload  -p 2222:22 atmoz/sftp  user1:lab123:1001

#user:user1
#password:lab123

#To log in with the OpenSSH client, run: sftp -P 2222 user1@127.0.0.1 
#password: lab123

