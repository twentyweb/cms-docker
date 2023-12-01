# syntax=docker/dockerfile:1

FROM twentyweb/cms-base:8.3

ARG TARGETARCH

RUN apk add --no-cache mysql-client \
    unit \
    unit-php83 \
    tzdata \
    curl \
    ca-certificates

COPY unit/conf.json /var/lib/unit/conf.json

ADD https://raw.githubusercontent.com/php/php-src/PHP-8.3/php.ini-production /etc/php83/php.ini
COPY php/conf.d /etc/php83/conf.d/

RUN rm -rf /var/cache/apk/* && \
        rm -rf /tmp/*

COPY scripts /scripts

RUN chmod +x /scripts/* \
    && rm -rf /scripts/entrypoint_laravel_app.sh \
    && sed -i 's/www-data/unit/g' /scripts/prepare_laravel.sh

EXPOSE 80

ENTRYPOINT ["/scripts/entrypoint_laravel_app__unit.sh"]
CMD []
