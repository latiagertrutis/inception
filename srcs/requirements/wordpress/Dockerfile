FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    php-mysqli \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

COPY wp-config.php /srv/www/wordpress/
COPY www.conf /etc/php/7.4/fpm/pool.d/

WORKDIR /srv/www/wordpress

ENTRYPOINT [ "php-fpm7.4", "-F" ]
