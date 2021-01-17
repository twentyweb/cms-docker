FROM php:8.0-fpm-alpine3.12

ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

WORKDIR /app

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

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