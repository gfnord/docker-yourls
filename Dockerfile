FROM mitcdh/hiawatha-php
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    curl \
    php5-gd \
    git && \
    rm -rf /var/cache/apk/*

ADD files/yourls.sh /scripts/pre-run/01_yourls
ADD files/hiawatha-yourls.conf /etc/hiawatha/conf.d/yourls.conf

RUN git clone -b master https://github.com/YOURLS/YOURLS.git /www

WORKDIR /www

EXPOSE 80

CMD ["/scripts/run.sh"]