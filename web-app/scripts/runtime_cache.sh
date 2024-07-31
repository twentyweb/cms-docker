#!/bin/sh

cd /app

if [ -f artisan ]; then
    php artisan config:cache || true
    php artisan route:cache || true
    php artisan view:cache || true
fi
