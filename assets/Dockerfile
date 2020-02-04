FROM node:12-alpine as assets

WORKDIR /app

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD 1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["all"]