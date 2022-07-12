FROM ubuntu:latest
RUN apt update
RUN apt install -y sudo openssh-server net-tools vim inetutils-ping cron sshpass
RUN useradd -rm -d /home/usuario -s /bin/bash -g root -G sudo -u 1000 usuario
RUN echo 'usuario:1234' | chpasswd
RUN ssh-keygen -b 2048 -t rsa -f /home/usuario/.ssh/id_rsa -q -N ""
RUN touch pass.txt
RUN echo 1234 >> pass.txt
RUN sshpass -f pass.txt ssh-copy-id usuario@172.17.0.2
RUN service ssh restart
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
#docker build -t sftp_user .
#docker run -d --name sftp_user -p 9999:22 sftp_user