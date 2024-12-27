FROM debian:11

ADD https://wordpress.org/latest.tar.gz /srv/www/

RUN tar -C /srv/www/ -zxvf /srv/www/latest.tar.gz && rm -f /srv/www/latest.tar.gz

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/www/wordpress

# ENTRYPOINT [ "php", "-S", "localhost:8000" ]
ENTRYPOINT [ "bash" ]
