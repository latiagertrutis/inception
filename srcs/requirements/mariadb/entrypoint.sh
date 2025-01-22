#!/bin/bash

set -e

# Create init file with environment variables credentials
cat <<EOF > /etc/mysql/init.sql
CREATE DATABASE wordpress;
USE wordpress;

-- Format is user@hostname.network_name. Network name appears here since we are using docker.

-- Wordpress user
CREATE USER '$MYSQL_USER'@'inception-wordpress.inception' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT SELECT,INSERT,UPDATE,DELETE ON wordpress.* TO 'wpuser'@'inception-wordpress.inception';

-- Admin user
CREATE USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'mrodrigu'@'localhost' WITH GRANT OPTION;
EOF

exec "$@"
