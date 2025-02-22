FROM debian:11 AS installer

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

ADD https://get.stalw.art/install.sh  /mail/

RUN chmod +x /mail/install.sh && /mail/install.sh /mail

FROM debian:11

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

COPY --from=installer /mail/bin/stalwart-mail /
COPY --from=installer /usr/bin/mysqladmin /usr/bin/
COPY  stalwart-mail-conf.toml /etc/

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/stalwart-mail", "-c", "/etc/stalwart-mail-conf.toml" ]
