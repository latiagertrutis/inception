FROM debian:11

ADD https://wordpress.org/latest.tar.gz /etc

RUN tar -C /etc -zxvf /etc/latest.tar.gz

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    php-mysqli \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY wp-config.php /etc/

ENV WORDPRESS_DIR=/srv/www/wordpress
WORKDIR /srv/www/wordpress

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "php-fpm7.4", "-F" ]
