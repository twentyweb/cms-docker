FROM twentyweb/cms-base:8.1

ARG TARGETARCH

RUN apk add --no-cache mysql-client \
  nginx \
  nginx-mod-http-xslt-filter \
  nginx-mod-http-geoip \
  tzdata \
  curl \
  ca-certificates

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm -rf /etc/nginx/conf.d/*
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d /etc/nginx/conf.d/
COPY nginx/default.conf /etc/nginx/sites-enabled/
COPY nginx/health.conf /etc/nginx/sites-enabled/

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
  && rm /usr/local/etc/php-fpm.d/zz-docker.conf
COPY php/conf.d $PHP_INI_DIR/conf.d/
COPY php/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf

ENV S6_OVERLAY_VERSION=v2.2.0.3
RUN case ${TARGETARCH} in \
         "amd64")  S6_OVERLAY_ARCH=amd64  ;; \
         "arm64")  S6_OVERLAY_ARCH=aarch64  ;; \
    esac \
  && curl -sSL -o s6-overlay-installer "https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCH}-installer" \
  && chmod +x s6-overlay-installer \
  && ./s6-overlay-installer / \
  && rm -rf ./s6-overlay-installer

RUN rm -rf /var/cache/apk/* && \
        rm -rf /tmp/*

COPY services.d /etc/services.d
COPY scripts /scripts

RUN chmod +x /scripts/*

EXPOSE 80

ENTRYPOINT ["/scripts/entrypoint_laravel_app.sh"]
CMD []

