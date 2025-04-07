# syntax=docker/dockerfile:1

ARG SUPERCRONIC_VERSION=v0.2.33

FROM twentyweb/cms-base:8.3

RUN apk add --no-cache mysql-client \
    unit \
    unit-php83 \
    tzdata \
    curl \
    ca-certificates

COPY unit/conf.json /var/lib/unit/conf.json

ADD https://raw.githubusercontent.com/php/php-src/PHP-8.3/php.ini-production /etc/php83/php.ini
COPY php/conf.d /etc/php83/conf.d/

ARG SUPERCRONIC_VERSION
ARG TARGETARCH
RUN curl -sSL -o supercronic "https://github.com/aptible/supercronic/releases/download/${SUPERCRONIC_VERSION}/supercronic-linux-${TARGETARCH}" \
    && chmod +x supercronic \
    && mv supercronic /usr/local/bin/supercronic

RUN rm -rf /var/cache/apk/* && \
        rm -rf /tmp/*

COPY scripts /scripts

RUN chmod +x /scripts/* \
    && rm -rf /scripts/entrypoint_laravel_app.sh \
    && mv /scripts/entrypoint_laravel_app__unit.sh /scripts/entrypoint_laravel_app.sh \
    && sed -i 's/www-data/unit/g' /scripts/prepare_laravel.sh

EXPOSE 80

ENTRYPOINT ["/scripts/entrypoint_laravel_app.sh"]
CMD []
