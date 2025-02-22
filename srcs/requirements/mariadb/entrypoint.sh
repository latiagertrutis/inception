#!/bin/bash

set -e

# Create init file with environment variables credentials
cat <<EOF > /etc/mysql/init.sql
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE DATABASE IF NOT EXISTS stalwartmail;
-- Format is user@hostname.network_name. Network name appears here since we are using docker.

-- Wordpress user
USE wordpress;

CREATE USER IF NOT EXISTS '$MYSQL_USER'@'inception-wordpress.inception' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'inception-wordpress.inception';

-- Mail user
USE stalwartmail;

CREATE USER IF NOT EXISTS '$MYSQL_MAIL_USER'@'inception-mail.inception' IDENTIFIED BY '$MYSQL_MAIL_PASSWORD';
GRANT ALL PRIVILEGES ON stalwartmail.* TO '$MYSQL_MAIL_USER'@'inception-mail.inception';

-- Admin user
CREATE USER IF NOT EXISTS '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'mrodrigu'@'localhost' WITH GRANT OPTION;
EOF

# Needed because of volume mounting
mariadb-install-db

exec "$@"
