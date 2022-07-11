FROM ubuntu:latest

LABEL maintainer="malcakx@gmail.com"
ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

RUN apt-get update && apt-get install -y cron && apt-get install -y ssh-client && apt-get install -y sshpass

WORKDIR /root
COPY entry.sh .
COPY sftp_connection.sh .
COPY storeme.txt .
COPY crontabfile /etc/cron.d/crontabfile
RUN chmod 777 sftp_connection.sh && chmod 0644 /etc/cron.d/crontabfile && crontab /etc/cron.d/crontabfile

CMD /root/entry.sh
