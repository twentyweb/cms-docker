.PHONY: base composer app assets nginx push

all: base composer app assets nginx

base:
	docker build -t twentyweb/cms-base:latest -t twentyweb/cms-base:7.4 ./base

composer: base
	docker build -t twentyweb/cms-composer:latest -t twentyweb/cms-composer:7.4 ./composer

app: base
	docker build -t twentyweb/cms-app:latest -t twentyweb/cms-app:7.4 ./app

assets:
	docker build -t twentyweb/cms-assets:latest ./assets

nginx:
	docker build -t twentyweb/cms-nginx:latest ./nginx

push: base composer app assets nginx
	docker push twentyweb/cms-base:latest
	docker push twentyweb/cms-base:7.4
	docker push twentyweb/cms-composer:latest
	docker push twentyweb/cms-composer:7.4
	docker push twentyweb/cms-app:latest
	docker push twentyweb/cms-app:7.4
	docker push twentyweb/cms-assets:latest
	docker push twentyweb/cms-nginx:latest