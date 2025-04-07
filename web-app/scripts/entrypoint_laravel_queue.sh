#!/bin/sh

/scripts/runtime_cache.sh

if [ $# -ne 0 ]; then
	exec "$@"
	exit 0
fi

set -e

cd /app

NAME=${NAME:-default}
QUEUE=${QUEUE:-default}
TRIES=${TRIES:-1}
TIMEOUT=${TIMEOUT:-90}

exec php artisan queue:work --verbose --name=$NAME --queue=$QUEUE --tries=$TRIES --timeout=$TIMEOUT
