FROM twentyweb/cms-web-app:8.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.13/main" >> /etc/apk/repositories \
    && echo "https://dl-cdn.alpinelinux.org/alpine/v3.13/community" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
      nodejs \
      npm \
      chromium=86.0.4240.111-r0 \
      harfbuzz=2.7.4-r1 \
      nss \
      freetype \
      ttf-freefont \
    && npm install --global --unsafe-perm puppeteer@5.3.0
