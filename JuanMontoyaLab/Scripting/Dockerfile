FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install openssh-server cron vim -y

COPY ["sftpKey", "."]

RUN chmod 700 sftpKey

RUN service ssh start

RUN touch /var/log/cron.log

EXPOSE 22

# RUN ssh -o StrictHostKeyChecking=no -i sftpKey sftpuser@172.17.0.2 -p 22 >> /var/log/cron.log

COPY ["connection.sh", "/connection.sh"]

RUN chmod 777 /connection.sh

RUN crontab crontab -l | { cat; echo "*/10 * * * * bash /connection.sh >> /var/log/cron.log 2>&1"; } | crontab -

CMD cron && tail -f /var/log/cron.log