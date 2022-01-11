FROM twentyweb/cms-base:8.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
    && apk add --no-cache \
      mysql-client \
      nodejs \
      npm \
      chromium=93.0.4577.82-r2 \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
    && npm install --global --unsafe-perm puppeteer@10.2.0

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY conf.d $PHP_INI_DIR/conf.d/
COPY php-fpm.d /usr/local/etc/php-fpm.d

COPY prepare.sh entrypoint.sh ./

RUN chmod +x prepare.sh \
    && chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD []
