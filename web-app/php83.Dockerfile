# syntax=docker/dockerfile:1

ARG S6_OVERLAY_VERSION=v2.2.0.3
ARG SUPERCRONIC_VERSION=v0.2.33

FROM twentyweb/cms-base:8.3

RUN apk add --no-cache mysql-client \
  nginx \
  nginx-mod-http-xslt-filter \
  nginx-mod-http-geoip \
  php83-fpm \
  tzdata \
  curl \
  ca-certificates

RUN ln -s /usr/sbin/php-fpm83 /usr/sbin/php-fpm \
    && adduser -D -H -G www-data www-data

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm -rf /etc/nginx/conf.d/*
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d /etc/nginx/conf.d/
COPY nginx/default.conf /etc/nginx/sites-enabled/
COPY nginx/health.conf /etc/nginx/sites-enabled/

ADD https://raw.githubusercontent.com/php/php-src/PHP-8.3/php.ini-production /etc/php83/php.ini
COPY php/conf.d /etc/php83/conf.d/
COPY php/php-fpm.d/www.conf /etc/php83/php-fpm.d/www.conf

ARG S6_OVERLAY_VERSION
ARG TARGETARCH
RUN case ${TARGETARCH} in \
         "amd64")  S6_OVERLAY_ARCH=amd64  ;; \
         "arm64")  S6_OVERLAY_ARCH=aarch64  ;; \
    esac \
  && curl -sSL -o s6-overlay-installer "https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCH}-installer" \
  && chmod +x s6-overlay-installer \
  && ./s6-overlay-installer / \
  && rm -rf ./s6-overlay-installer

ARG SUPERCRONIC_VERSION
ARG TARGETARCH
RUN curl -sSL -o supercronic "https://github.com/aptible/supercronic/releases/download/${SUPERCRONIC_VERSION}/supercronic-linux-${TARGETARCH}" \
    && chmod +x supercronic \
    && mv supercronic /usr/local/bin/supercronic

RUN rm -rf /var/cache/apk/* && \
        rm -rf /tmp/*

COPY services.d /etc/services.d
COPY scripts /scripts

RUN chmod +x /scripts/*

EXPOSE 80

ENTRYPOINT ["/scripts/entrypoint_laravel_app.sh"]
CMD []

