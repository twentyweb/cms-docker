FROM twentyweb/cms-base:7.4

ARG COMPOSER_GITLAB

RUN apk add git

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["prod"]