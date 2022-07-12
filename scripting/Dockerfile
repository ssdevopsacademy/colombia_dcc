#for build: docker build -t conect .
#created a shared folder: touch /Users/jhon.bedoya/logs/conection.log
#for run: docker run -d -v /Users/jhon.bedoya/logs:/tmp/logs --name=con conect 

FROM ubuntu:latest
LABEL maintainer="jhonbedoya.ids@gmail.com"
RUN apt-get update && apt-get -y install --force-yes cron sshpass
#creo los archivos y el log
RUN mkdir /tmp/logs/
RUN touch /tmp/logs/conection.log 
RUN touch /conection.sh
RUN touch /crontab
RUN echo "echo 'conectando'" >> /conection.sh
RUN echo "echo 'ls' | sshpass -p “secret” sftp -v -P 2222 jhon@172.17.0.1" >> /conection.sh
RUN chmod 644 /conection.sh
RUN echo "10 * * * * /conection.sh >> /tmp/logs/conection.log" >> /crontab
RUN crontab /crontab
CMD cron && tail -f /tmp/logs/conection.log