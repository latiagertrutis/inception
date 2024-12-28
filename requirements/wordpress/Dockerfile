FROM debian:11

ADD https://wordpress.org/latest.tar.gz /srv/www/

RUN tar -C /srv/www/ -zxvf /srv/www/latest.tar.gz && rm -f /srv/www/latest.tar.gz

RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm=2:7.4+76 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/php
    # && sed -i 's/listen = .*/listen = 0.0.0.0:8000/g' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /srv/www/wordpress

# ENTRYPOINT [ "php", "-S", "inception-wordpress:8000" ]
ENTRYPOINT [ "bash" ]
