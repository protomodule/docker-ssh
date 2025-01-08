FROM alpine:latest
RUN apk add --no-cache openssh-client ca-certificates bash && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing --update lolcat figlet
COPY ssh_config /etc/ssh/ssh_config
COPY entrypoint.sh /
RUN chmod ug+x /entrypoint.sh && \
    chown root:root /etc/ssh/ssh_config && \
    chmod 644 /etc/ssh/ssh_config
ENTRYPOINT ["/entrypoint.sh"]
