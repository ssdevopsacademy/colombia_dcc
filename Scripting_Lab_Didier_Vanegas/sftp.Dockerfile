# Pull the minimal Ubuntu image
FROM ubuntu

COPY sftp-install.sh /home
RUN chmod +x /home/sftp-install.sh

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Expose the port for access
EXPOSE 22

# Run the Nginx server
ENTRYPOINT ["/home/sftp-install.sh"]

CMD ["/usr/sbin/sshd", "-D"]