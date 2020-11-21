COMPOSER:=$(shell which composer)
NPM:=$(shell which npm)
SERVERLESS:=$(shell which serverless)
NPM_VERSION:=10

php:
	sudo apt install -y php php-xml php-curl

${NPM}:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
	nvm install ${NPM_VERSION}

${COMPOSER}: php
	sudo apt install -y composer

${SERVERLESS}: ${NPM}
	npm i -g serverless

requirements: \
	${SERVERLESS} \
	${COMPOSER} \
	vendor

vendor:
	composer install --prefer-dist --optimize-autoloader --no-dev

deploy: vendor
	serverless deploy
	
test:
	@echo "Exposing service through port 8080..."
	docker run -v $$PWD:/var/www/html -p8080:80 php:7.4-apache