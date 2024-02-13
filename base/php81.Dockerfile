FROM php:8.1-fpm-alpine3.18

ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

WORKDIR /app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && install-php-extensions \
        bcmath \
        ftp \
        gd \
        gettext \
        gmp \
        intl \
        mysqli \
        opcache \
        pcntl \
        pdo_mysql \
        soap \
        zip \
        imagick \
        exif \
        redis \
    && apk add --no-cache \
        bash \
        musl-locales \
        less