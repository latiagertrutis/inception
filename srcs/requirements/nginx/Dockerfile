FROM debian:11 AS web_extractor


COPY static_site/bellard.tar.gz.part* /
RUN cat /bellard.tar.gz.part* > /bellard.tar.gz && tar -zxvf /bellard.tar.gz -C /

FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

COPY nginx.conf /etc/nginx/
COPY ${SSL_CERT} /etc/ssl/
COPY ${SSL_CERT_KEY} /etc/ssl/
COPY --from=web_extractor /bellard /srv/www/bellard

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
