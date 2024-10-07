FROM twentyweb/cms-web-app:8.2

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN apk update \
  && apk add --no-cache \
  mysql-client \
  nodejs \
  npm \
  chromium \
  ttf-freefont \
  && npm install --global --unsafe-perm puppeteer

RUN mkdir -p /home/www-data \
  && chown -R www-data:www-data /home/www-data

# test puppeteer installation
COPY puppeteer /scripts/puppeteer
RUN chmod +x /scripts/puppeteer/*.sh \
  && su www-data -c "/scripts/puppeteer/puppeteer_test.sh"
