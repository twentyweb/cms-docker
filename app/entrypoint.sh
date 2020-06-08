#!/bin/sh

HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo -e "$HOST_IP\t$HOST_DOMAIN" >> /etc/hosts
fi

role=${CONTAINER_ROLE:-app}
app_env=${APP_ENV:-production}

echo "Running in $app_env environment"


if [ $# -ne 0 ]; then
	$@
	exit 0;
fi

set -e

cd /app

if [ "$app_env" != "local" ]; then

    echo "Caching configuration..."
    php artisan config:cache

fi


if [ "$role" = "app" ]; then

  php artisan route:cache
  php artisan view:cache
	php artisan migrate --verbose --no-interaction --force
  php artisan resources:update || true
  php-fpm

elif [ "$role" = "queue" ]; then

	echo "Running the queue..."
	queue=${QUEUE:-default}
  php artisan queue:work --queue=$queue --verbose --tries=3 --timeout=90

elif [ "$role" = "horizon" ]; then

	echo "Running horizon..."
  php artisan horizon

elif [ "$role" = "scheduler" ]; then

    while [ true ]
    do
      php artisan schedule:run --verbose --no-interaction &
      sleep 60
    done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi
