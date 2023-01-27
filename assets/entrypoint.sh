#!/bin/sh

set -e

if [ "$1" = 'backend' ]; then
    yarn install --non-interactive --silent
    yarn run backend:prod
    return
elif [ "$1" = 'frontend' ]; then
    yarn install --non-interactive --silent
    yarn run prod
    return
elif [ "$1" = 'all' ]; then
    yarn install --non-interactive --silent
    yarn run prod
    yarn run backend:prod
    return
fi

exec "$@"