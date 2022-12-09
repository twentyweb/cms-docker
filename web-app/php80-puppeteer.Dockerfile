FROM twentyweb/cms-web-app:8.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
    && apk add --no-cache \
      mysql-client \
      nodejs \
      npm \
      chromium \
      ttf-freefont \
    && npm install --global --unsafe-perm puppeteer@14.1.2 # chromium v102
