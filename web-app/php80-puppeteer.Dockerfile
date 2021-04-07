FROM twentyweb/cms-web-app:8.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
    && apk add --no-cache nodejs npm chromium=86.0.4240.111-r0 \
    && npm install --global --unsafe-perm puppeteer@5.3.1
