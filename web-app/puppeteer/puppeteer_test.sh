#!/bin/sh

set -e

NODE_PATH=$(npm root -g) node "$(dirname $0)"/puppeteer_test.cjs
