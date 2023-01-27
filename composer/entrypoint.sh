#!/bin/sh

set -e

isCommand() {
  for cmd in \
    "about" \
    "archive" \
    "browse" \
    "check-platform-reqs" \
    "clear-cache" \
    "clearcache" \
    "config" \
    "create-project" \
    "depends" \
    "diagnose" \
    "dump-autoload" \
    "dumpautoload" \
    "exec" \
    "global" \
    "help" \
    "home" \
    "info" \
    "init" \
    "install" \
    "licenses" \
    "list" \
    "outdated" \
    "prohibits" \
    "remove" \
    "require" \
    "run-script" \
    "search" \
    "self-update" \
    "selfupdate" \
    "show" \
    "status" \
    "suggests" \
    "update" \
    "upgrade" \
    "validate" \
    "why" \
    "why-not"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# Provide github token if you are using composer a lot in non-interactive mode
# Otherwise one day it will get stuck with request for authorization
if [[ ! -z "$COMPOSER_GITHUB" ]]
then
  composer config --global github-oauth.github.com "$COMPOSER_GITHUB"
fi

if [[ ! -z "$COMPOSER_GITLAB" ]]
then
  composer config --global gitlab-token.gitlab.com "$COMPOSER_GITLAB"
fi

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- composer "$@"
# check if the first argument passed in is composer
elif [ "$1" = 'composer' ]; then
  set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /sbin/tini -- composer "$@"
elif [ "$1" = 'prod' ]; then
  composer check-platform-reqs
  composer install --no-dev --optimize-autoloader --no-interaction --no-progress --no-scripts --prefer-dist
  return 0
fi

exec "$@"