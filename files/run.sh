#!/bin/sh
IFS=$'\n'
echo "Rodando a roda..."
cat /scripts/Caddyfile > /www/Caddyfile
echo "$*" >> /www/Caddyfile
chown web-srv:www-data /www/Caddyfile
mkdir -p /www/public/user
chown -R web-srv:www-data /www
exec su -s /bin/sh -c "exec caddy" web-srv
