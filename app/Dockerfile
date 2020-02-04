FROM twentyweb/base:7.4

RUN apk add mysql-client nodejs npm
    && npm install --global puppeteer

COPY conf.d $PHP_INI_DIR/conf.d/

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD []
