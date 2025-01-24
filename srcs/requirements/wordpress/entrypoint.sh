#!/bin/bash

set -e

if [ -z $(ls -A "$WORDPRESS_DIR") ]; then
    cp -r /etc/wordpress/* "$WORDPRESS_DIR"
    cp /etc/wp-config.php "$WORDPRESS_DIR/"
fi

exec "$@"
