## usage:
# docker run -d --rm -e SERVER_NAME=sftpcontainer -e USER=carga -e SSHPASS=Pruebas.123  --name cronssh --network lab01 cron-client-ssh
FROM debian:buster-slim

ENV PATH_SCRIPT=/root/connect.sh
ENV SERVER_NAME=sftpcontainer
ENV USER=carga
ENV SSHPASS=Pruebas.123

# Add the script to the Docker Image

RUN set -x \
&& echo "\
echo "-----------------------------------------------------------------" >> /root/run.log \n\
echo "connecting sftp server - send command 'ls'" >> /root/run.log \n\
sshpass -e sftp -o StrictHostKeyChecking=no $USER@$SERVER_NAME <<< $'ls'; \n\
" >  $PATH_SCRIPT \
&& cat $PATH_SCRIPT

# Add the cron job (scheduler)

RUN set -x \
&& echo "\
*/10  * * * * bash $PATH_SCRIPT \n\
" >  /root/crontab.txt \
&& cat /root/crontab.txt


# Give execution rights on the cron scripts
RUN chmod 0755 $PATH_SCRIPT

#Install Cron
RUN apt update && apt install -y --no-install-recommends cron ssh sshpass  && rm -rf /var/lib/apt/lists/*

RUN crontab /root/crontab.txt

# Run the command on container startup
CMD ["cron", "-f"]
