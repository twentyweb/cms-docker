# syntax=docker/dockerfile:1

FROM alpine:edge

ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

WORKDIR /app

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
      bash \
      curl \
      less \
      musl-locales \
      php83 \
      php83-bcmath \
      php83-curl \
      php83-dom \
      php83-exif \
      php83-fileinfo \
      php83-gd \
      php83-gettext \
      php83-gmp \
      php83-intl \
      php83-mbstring \
      php83-mysqli \
      php83-opcache \
      php83-openssl \
      php83-pcntl \
      php83-pdo_mysql \
      php83-pecl-redis \
      php83-phar \
      php83-posix \
      php83-session \
      php83-simplexml \
      php83-soap \
      php83-tokenizer \
      php83-xml \
      php83-xmlreader \
      php83-xmlwriter \
      php83-zip
#      php83-pecl-imagick \

RUN ln -s /usr/bin/php83 /usr/bin/php