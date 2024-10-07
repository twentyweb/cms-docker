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
  && npm install --location=global puppeteer@22.8.2

# test puppeteer installation
COPY puppeteer /scripts/puppeteer
RUN chmod +x /scripts/puppeteer/*.sh
# RUN /scripts/puppeteer/puppeteer_test.sh
