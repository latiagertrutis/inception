#!/bin/bash

set -e

until mysqladmin ping --connect-timeout 1 --silent -u $MYSQL_MAIL_USER -p$MYSQL_MAIL_PASSWORD -h inception-mariadb; do
    if (( $SECONDS > 60 )); then
	exit 1;
    fi
    sleep 1;
done

exec "$@"
