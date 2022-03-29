FROM twentyweb/cms-web-app:8.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
    && apk add --no-cache \
      mysql-client \
      nodejs \
      npm \
      chromium=99.0.4844.84-r0 \
      ttf-freefont \
    && npm install --global --unsafe-perm puppeteer@13.4.1
