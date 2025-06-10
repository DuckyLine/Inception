FROM alpine:3.20

RUN apk update && \
	apk add openssh && \
	adduser -D ftpuser && \
	echo "ftpuser:${FTP_PASSWORD}" | chpasswd && \
	mkdir -p /home/ftpuser/upload && \
	chown -R ftpuser:ftpuser /home/ftpuser && \
	chmod 700 /home/ftpuser && \
	ssh-keygen -A

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]