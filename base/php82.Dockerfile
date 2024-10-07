FROM php:8.2-fpm-alpine3.20

ENV MUSL_LOCPATH=/usr/share/i18n/locales/musl

WORKDIR /app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && install-php-extensions \
    bcmath \
    exif \
    ftp \
    gd \
    gettext \
    gmp \
    imagick \
    intl \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    redis \
    soap \
    xsl \
    zip \
    && apk add --no-cache \
    bash \
    musl-locales \
    less
