#!/bin/bash
set -e
usuario=usuario
password=1234

#### sftp_server.sh
touch sftp_server.sh
echo "#!/bin/bash" >> sftp_server.sh
echo "apt update" >> sftp_server.sh
echo "apt install -y openssh-server sudo net-tools vim apt-utils inetutils-syslogd inetutils-ping psmisc" >> sftp_server.sh
echo "service inetutils-syslogd start" >> sftp_server.sh
echo "addgroup sftp" >> sftp_server.sh
echo "useradd -rm -d /home/$usuario -s /bin/bash -g root -G sudo -u 1000 $usuario" >> sftp_server.sh
echo "echo '$usuario:$password' | chpasswd" >> sftp_server.sh
echo "sed -i 's/^Subsystem.*$/Subsystem sftp \/usr\/lib\/openssh\/sftp-server -f AUTHPRIV -l INFO/' /etc/ssh/sshd_config" >> sftp_server.sh
echo "echo \"Match Group sftp\" >> /etc/ssh/sshd_config" >> sftp_server.sh
echo "echo \"  ChrootDirectory %h\" >> /etc/ssh/sshd_config" >> sftp_server.sh
echo "echo \"  X11Forwarding no\" >> /etc/ssh/sshd_config" >> sftp_server.sh
echo "echo \"  AllowTcpForwarding no\" >> /etc/ssh/sshd_config" >> sftp_server.sh
echo "echo \"  ForceCommand internal-sftp\" >> /etc/ssh/sshd_config" >> sftp_server.sh
echo "service ssh restart" >> sftp_server.sh
echo "exit" >> sftp_server.sh
#
#### Dockerfile
touch Dockerfile
echo "FROM ubuntu:latest" >> Dockerfile
echo "RUN mkdir -p /scripts" >> Dockerfile
echo "COPY sftp_server.sh /scripts" >> Dockerfile
echo "WORKDIR /scripts" >> Dockerfile
echo "RUN chmod +x sftp_server.sh" >> Dockerfile
echo "RUN ./sftp_server.sh" >> Dockerfile
echo "EXPOSE 22" >> Dockerfile
echo "CMD [\"/usr/sbin/sshd\",\"-D\"]" >> Dockerfile
docker build -t sftp_ubuntu .
docker run -d --name sftp_ubuntu -p 8888:22 sftp_ubuntu
rm -rf sftp_server.sh Dockerfile
exit
