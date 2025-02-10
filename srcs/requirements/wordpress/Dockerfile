FROM debian:11 AS unpack

RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Redis cache
ADD https://downloads.wordpress.org/plugin/redis-cache.2.5.4.zip /
RUN unzip /redis-cache.2.5.4.zip -d / && rm -f /redis-cache.2.5.4.zip

# Wordpress site
ADD https://wordpress.org/latest.tar.gz /
RUN tar -C / -zxvf /latest.tar.gz && rm -f /latest.tar.gz


FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    php-mysqli \
    php-redis \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY wp-config.php /
COPY --from=unpack /wordpress /wordpress
COPY --from=unpack /redis-cache /redis-cache

ENV WORDPRESS_DIR=/srv/www/wordpress
WORKDIR /srv/www/wordpress

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "php-fpm7.4", "-F" ]
