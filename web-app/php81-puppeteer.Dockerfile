FROM twentyweb/cms-web-app:8.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
    && apk add --no-cache nodejs npm chromium=93.0.4577.82-r0 \
    && npm install --global --unsafe-perm puppeteer@^10.2.0
