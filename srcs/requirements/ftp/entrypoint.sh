#!/bin/bash

set -e

mkdir -p /var/run/vsftpd/empty
adduser --disabled-login --no-create-home --gecos "" "$FTP_USER"
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec "$@"
