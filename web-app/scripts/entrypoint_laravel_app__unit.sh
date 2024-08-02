#!/bin/sh

/scripts/runtime_cache.sh

if [ $# -ne 0 ]; then
	$@
	exit 0
fi

set -e

unitd --no-daemon --log /dev/stdout
