#!/bin/sh

/scripts/runtime_cache.sh

if [ $# -ne 0 ]; then
	exec "$@"
	exit 0
fi

set -e

echo "* * * * * cd /app && php artisan schedule:run" >/tmp/crontab
exec /usr/local/bin/supercronic /tmp/crontab
