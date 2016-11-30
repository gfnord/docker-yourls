FROM gfnord/caddy-php
MAINTAINER Gustavo Nobrega <gustavofn@gmail.com>

RUN apk --update add \
    php5-pdo_mysql && \
    rm -rf /var/cache/apk/*
VOLUME /www/public/user

ADD files/yourls.sh /www/yourls.sh
ADD files/Caddyfile /scripts/Caddyfile
RUN chmod +x /www/yourls.sh && chown -R web-srv:www-data /www/public

EXPOSE 8031
