#!/bin/sh

cd /app

DISABLE_CACHE=${DISABLE_CACHE:=false}

if [ -f artisan ] && [ "$DISABLE_CACHE" != true ]; then
    php artisan config:cache || true
    php artisan route:cache || true
    php artisan view:cache || true
    php artisan event:cache || true
fi
