FROM twentyweb/cms-base:7.4

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN apk add --no-cache mysql-client nodejs npm chromium \
    && npm install --global --unsafe-perm puppeteer@4.0.0

COPY conf.d $PHP_INI_DIR/conf.d/

COPY prepare.sh entrypoint.sh ./

RUN chmod +x prepare.sh \
    && chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD []
