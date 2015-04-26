FROM ubuntu:latest

# Install python dependancies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    dovecot-imapd &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# launch the stuff
COPY entrypoint.sh /root/entrypoint.sh
COPY dovecot /etc/dovecot
CMD ["/bin/bash", "-c", "/root/entrypoint.sh" ]

EXPOSE 993
