FROM gfnord/caddy-php
MAINTAINER Gustavo Nobrega <gustavofn@gmail.com>

RUN apk --update add \
    php5-pdo_mysql && \
    rm -rf /var/cache/apk/*
VOLUME /www/public/user

ADD files/run.sh /scripts/run.sh
ADD files/yourls.sh /www/yourls.sh
ADD files/Caddyfile /scripts/Caddyfile
RUN chmod +x /scripts/run.sh
RUN chmod +x /www/yourls.sh 
RUN chown -R web-srv:www-data /www
