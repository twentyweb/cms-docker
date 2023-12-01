all: assets base composer web-app web-app-puppeteer

base: base-81 base-82
composer: composer-81 composer-82
web-app: web-app-81 web-app-82
web-app-puppeteer: web-app-81-puppeteer web-app-82-puppeteer

.PHONY: assets
assets:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file assets/Dockerfile -t twentyweb/cms-assets:latest ./assets

.PHONY: base-81
base-81:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file base/php81.Dockerfile -t twentyweb/cms-base:8.1 ./base

.PHONY: base-82
base-82:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file base/php82.Dockerfile -t twentyweb/cms-base:8.2 ./base

.PHONY: base-83
base-83:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file base/php83.Dockerfile -t twentyweb/cms-base:8.3 ./base

.PHONY: composer-81
composer-81:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file composer/php81.Dockerfile -t twentyweb/cms-composer:8.1 ./composer

.PHONY: composer-82
composer-82:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file composer/php82.Dockerfile -t twentyweb/cms-composer:8.2 ./composer

.PHONY: composer-83
composer-83:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file composer/php83.Dockerfile -t twentyweb/cms-composer:8.3 ./composer

.PHONY: web-app-81
web-app-81:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php81.Dockerfile -t twentyweb/cms-web-app:8.1 ./web-app

.PHONY: web-app-82
web-app-82:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php82.Dockerfile -t twentyweb/cms-web-app:8.2 ./web-app

.PHONY: web-app-83
web-app-83:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php83.Dockerfile -t twentyweb/cms-web-app:8.3 ./web-app

.PHONY: web-app-83-unit
web-app-83-unit:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php83-unit.Dockerfile -t twentyweb/cms-web-app:8.3-unit ./web-app

.PHONY: web-app-81-puppeteer
web-app-81-puppeteer:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php81-puppeteer.Dockerfile -t twentyweb/cms-web-app:8.1-puppeteer ./web-app

.PHONY: web-app-82-puppeteer
web-app-82-puppeteer:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php82-puppeteer.Dockerfile -t twentyweb/cms-web-app:8.2-puppeteer ./web-app

.PHONY: web-app-83-puppeteer
web-app-83-puppeteer:
	docker buildx build --platform linux/amd64,linux/arm64 --pull --push --file web-app/php83-puppeteer.Dockerfile -t twentyweb/cms-web-app:8.3-puppeteer ./web-app
