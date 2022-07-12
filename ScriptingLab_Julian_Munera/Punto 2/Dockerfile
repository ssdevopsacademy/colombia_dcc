FROM alpine:3.12

#RUN apt-get -y update; \
#apt-get -y upgrade; \
#apt-get -Y install ssh

#RUN ssh-keygen -q -t rsa -N '' -f /id_rsa

COPY my_bash /bin/my_bash
COPY root /var/spool/cron/crontabs/root
RUN chmod +x /bin/my_bash
CMD crond -l 2 -f