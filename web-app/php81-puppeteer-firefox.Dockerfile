FROM twentyweb/cms-web-app:8.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_PRODUCT=firefox
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/firefox

RUN apk update \
  && apk add --no-cache \
  nodejs \
  npm \
  firefox \
  && npm install --global --unsafe-perm puppeteer

RUN mkdir -p /home/www-data \
  && chown -R www-data:www-data /home/www-data

# test puppeteer installation
COPY puppeteer /scripts/puppeteer
RUN chmod +x /scripts/puppeteer/*.sh
# RUN /scripts/puppeteer/puppeteer_test.sh
