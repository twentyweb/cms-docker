#!/bin/sh

cd /app

if [ -f artisan ] && ["$DISABLE_CACHE" != "false"]; then
    php artisan config:cache || true
    php artisan route:cache || true
    php artisan view:cache || true
    php artisan event:cache || true
fi
