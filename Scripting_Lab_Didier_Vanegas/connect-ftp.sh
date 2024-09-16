export SSHPASS=ftpuser
sshpass -e sftp -P 32768 ftpuser@192.168.56.20
time=$(date +"%H:%M")
echo "Testing sftp connection at $time"
