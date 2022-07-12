#/bin/bash

apt-get install ssh
echo -e "Match group sftp" >> /etc/ssh/sshd_config
echo -e "ChrootDirectory /home" >> /etc/ssh/sshd_config
echo -e "X11Forwarding no" >> /etc/ssh/sshd_config
echo -e "AllowTcpForwarding no" >> /etc/ssh/sshd_config
echo -e "ForceCommand internal-sftp" >> /etc/ssh/sshd_config
addgroup sftp  
useradd -p $(openssl passwd -1 123) -m jemunera_sftp -g sftp
chmod 700 /home/jemunera_sftp
service ssh restart
echo "Terminó"
