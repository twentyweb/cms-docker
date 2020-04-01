FROM nginx:1.17-alpine

WORKDIR /app

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d /etc/nginx/conf.d/

COPY default.conf /etc/nginx/sites-enabled/

