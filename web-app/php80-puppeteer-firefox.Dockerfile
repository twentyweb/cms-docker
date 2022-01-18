FROM twentyweb/cms-web-app:8.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_PRODUCT=firefox
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/firefox

RUN apk update \
    && apk add --no-cache \
      nodejs \
      npm \
      firefox \
    && npm install --global --unsafe-perm puppeteer
