#!/bin/sh

/scripts/runtime_cache.sh

if [ $# -ne 0 ]; then
	exec "$@"
	exit 0
fi

set -e

exec unitd --no-daemon --log /dev/stdout
