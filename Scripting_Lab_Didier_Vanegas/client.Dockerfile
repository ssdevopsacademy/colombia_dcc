FROM ubuntu

RUN apt-get update && apt-get --yes install sshpass cron

COPY connect-ftp.sh /home
RUN chmod +x /home/connect-ftp.sh

COPY connect-cron /etc/cron.d/connect-cron
RUN chmod 0644 /etc/cron.d/connect-cron

RUN crontab /etc/cron.d/connect-cron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log