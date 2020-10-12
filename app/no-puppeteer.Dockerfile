FROM twentyweb/cms-base:7.4

RUN apk add --no-cache mysql-client

COPY conf.d $PHP_INI_DIR/conf.d/

COPY prepare.sh entrypoint.sh ./

RUN chmod +x prepare.sh \
    && chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD []
