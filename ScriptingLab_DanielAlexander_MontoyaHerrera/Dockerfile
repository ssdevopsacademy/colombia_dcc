FROM ubuntu:latest

#source: https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container

# docker build --rm -t devops-cron  .
# docker run  --mount type=bind,source=/home/cientifiqus/Documents/devops/scriptingAndprogramming/log/,target=/tmp/log/  -t -i devops-cron


#prepare system
RUN apt-get update && apt-get -y install --force-yes cron sshpass

# Copy cron file to the cron.d directory
COPY devops-cron /etc/cron.d/devops-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/devops-cron

# Apply cron job
RUN crontab /etc/cron.d/devops-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
