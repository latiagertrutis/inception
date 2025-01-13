FROM debian:11

ADD https://wordpress.org/latest.tar.gz /srv/www/

RUN tar -C /srv/www/ -zxvf /srv/www/latest.tar.gz && rm -f /srv/www/latest.tar.gz

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    mariadb-client \
    php-mysqli \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/php

COPY wp-config.php /srv/www/wordpress

WORKDIR /srv/www/wordpress

ENTRYPOINT [ "php-fpm7.4", "-F" ]
# ENTRYPOINT [ "bash" ]
