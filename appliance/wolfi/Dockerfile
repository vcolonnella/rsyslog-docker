FROM	cgr.dev/chainguard/wolfi-base
LABEL   maintainer="rgerhards@adiscon.com"
COPY	rsyslog@lists.adiscon.com-5a55e598.rsa.pub /etc/apk/keys/rsyslog@lists.adiscon.com-5a55e598.rsa.pub
RUN	apk --no-cache update  \
	&& apk add --no-cache \
	   rsyslog \
	   rsyslog-relp \
	   rsyslog-elasticsearch \
	   rsyslog-mmjsonparse \
	   rsyslog-mmutf8fix
RUN	adduser -s /bin/ash -D rsyslog rsyslog \
	&& echo "rsyslog ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
VOLUME	/config /work /logs
CMD	["rsyslog"]
ENTRYPOINT ["/home/appliance/starter.sh"]
COPY	--chown=root:root rsyslog.conf /etc/rsyslog.conf
COPY	--chown=root:root rsyslog.conf.d/*.conf /etc/rsyslog.conf.d/
# done base system setup

WORKDIR /home/appliance
COPY	--chown=rsyslog:rsyslog starter.sh CONTAINER.* ./
COPY	--chown=rsyslog:rsyslog internal/* ./internal/
COPY	--chown=rsyslog:rsyslog tools/* ./tools/
RUN	echo "`date +%F` (`date +%s`)" > CONTAINER.release \
	&& chown -R rsyslog:rsyslog * && chmod 755 starter.sh

USER rsyslog
