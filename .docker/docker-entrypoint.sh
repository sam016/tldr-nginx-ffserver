#!/bin/sh
set -e

# create file if missing
touch /etc/nginx/conf.d/nginx.htpasswd

echo "admin_user: $ADMIN_USER"
echo "admin_pass: $ADMIN_PASS"

# add the admin password
htpasswd -b /etc/nginx/conf.d/nginx.htpasswd "$ADMIN_USER" "$ADMIN_PASS"

echo "Starting ffserver"
ffserver -f /code/ffserver/ffserver.conf &

# nginx -g "daemon off;"
nginx-debug -g "daemon off;"
