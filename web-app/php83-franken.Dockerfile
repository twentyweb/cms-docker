# syntax=docker/dockerfile:1

FROM twentyweb/cms-base:8.3

ARG TARGETARCH

RUN apk add --no-cache mysql-client \
    tzdata \
    curl \
    ca-certificates

COPY franken/Caddyfile /etc/caddy/Caddyfile

ADD https://raw.githubusercontent.com/php/php-src/PHP-8.3/php.ini-production /etc/php83/php.ini
COPY php/conf.d /etc/php83/conf.d/

RUN rm -rf /var/cache/apk/* && \
        rm -rf /tmp/*

COPY scripts /scripts

COPY --from=dunglas/frankenphp:1-php8.3 /usr/local/bin/frankenphp /usr/local/bin/frankenphp

RUN chmod +x /scripts/* \
    && rm -rf /scripts/entrypoint_laravel_app.sh \
    && rm -rf /scripts/entrypoint_laravel_app__unit.sh \
    && mv /scripts/entrypoint_laravel_app__franken.sh /scripts/entrypoint_laravel_app.sh

EXPOSE 80

ENTRYPOINT ["/scripts/entrypoint_laravel_app.sh"]
CMD []
