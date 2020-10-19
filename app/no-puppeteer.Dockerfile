FROM twentyweb/cms-base:7.4

RUN apk add --no-cache mysql-client

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY conf.d $PHP_INI_DIR/conf.d/
COPY php-fpm.d /usr/local/etc/php-fpm.d

COPY prepare.sh entrypoint.sh ./

RUN chmod +x prepare.sh \
    && chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD []
