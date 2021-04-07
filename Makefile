.PHONY: base-74 base-80 composer-74 composer-80 app-74 app-80 app-74-no-puppeteer app-80-no-puppeteer assets nginx web-app-80 web-app-80-puppeteer

all: base composer app app-no-puppeteer assets nginx web-app web-app-puppeteer

base: base-74 base-80
composer: composer-74 composer-80
app: app-74 app-80
app-no-puppeteer: app-74-no-puppeteer app-80-no-puppeteer
web-app: web-app-80
web-app-puppeteer: web-app-80-puppeteer

base-80:
	docker buildx build --pull --push --file base/php80.Dockerfile -t twentyweb/cms-base:8.0 ./base

base-74:
	docker buildx build --pull --push --file base/php74.Dockerfile -t twentyweb/cms-base:7.4 -t twentyweb/cms-base:latest ./base

composer-80:
	docker buildx build --pull --push --file composer/php80.Dockerfile -t twentyweb/cms-composer:8.0 ./composer

composer-74:
	docker buildx build --pull --push --file composer/php74.Dockerfile -t twentyweb/cms-composer:7.4 -t twentyweb/cms-composer:latest ./composer

app-80:
	docker buildx build --pull --push --file app/php80.Dockerfile -t twentyweb/cms-app:8.0 ./app

app-74:
	docker buildx build --pull --push --file app/php74.Dockerfile -t twentyweb/cms-app:7.4 ./app

app-80-no-puppeteer:
	docker buildx build --pull --push --file app/php80-noPuppeteer.Dockerfile -t twentyweb/cms-app:8.0-no-puppeteer ./app

app-74-no-puppeteer:
	docker buildx build --pull --push --file app/php74-noPuppeteer.Dockerfile -t twentyweb/cms-app:7.4-no-puppeteer ./app

web-app-80:
	docker buildx build --pull --push --file web-app/php80.Dockerfile -t twentyweb/cms-web-app:8.0 ./web-app

web-app-80-puppeteer:
	docker buildx build --pull --push --file web-app/php80-puppeteer.Dockerfile -t twentyweb/cms-web-app:8.0-puppeteer ./web-app

assets:
	docker buildx build --pull --push --file assets/Dockerfile -t twentyweb/cms-assets:latest ./assets

nginx:
	docker buildx build --pull --push --file nginx/Dockerfile -t twentyweb/cms-nginx:latest ./nginx