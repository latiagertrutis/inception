FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    mariadb-server \
    emacs \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/mysqld

COPY my.cnf /etc/mysql/my.cnf
COPY init.sql /etc/mysql/init.sql
COPY server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "mariadbd" ]
