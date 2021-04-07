#!/bin/sh

# Fix: telescope requires cache connection on registration
export TELESCOPE_ENABLED=false

cd /app

php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true