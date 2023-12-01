FROM twentyweb/cms-web-app:8.3

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
    && apk add --no-cache \
      mysql-client \
      nodejs \
      npm \
      chromium \
      ttf-freefont \
    && npm install --global --unsafe-perm puppeteer@21.4.1 # chromium v118
