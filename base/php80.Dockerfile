FROM php:8.0-fpm-alpine3.13

ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

WORKDIR /app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && install-php-extensions \
        bcmath \
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
    && apk add --no-cache musl-locales