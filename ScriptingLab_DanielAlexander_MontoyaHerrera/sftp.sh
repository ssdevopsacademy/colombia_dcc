#! /bin/bash

#source: https://hub.docker.com/r/atmoz/sftp


mkdir -p sftp; docker run  -v sftp:/home/foo/upload  -p 2222:22 atmoz/sftp  foo:pass:1001





#connect with password = pass
#sftp -P 2222 foo@127.0.0.1 
