FROM twentyweb/cms-base:7.4

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN apk add --no-cache mysql-client nodejs npm chromium \
    && npm install --global --unsafe-perm puppeteer@2.0.0

COPY conf.d $PHP_INI_DIR/conf.d/

COPY entrypoint.sh .

RUN mkdir -p storage/app/public && \
	mkdir -p storage/backups && \
	mkdir -p storage/framework/cache && \
	mkdir -p storage/framework/sessions && \
	mkdir -p storage/framework/views && \
	mkdir -p storage/logs && \
	chmod ug+wx -R storage && \
	chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD []
