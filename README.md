# Serverles PHP AWS Lambda

This repository contains a Hello World PHP example to be deployed through Serverless framework.

## How?

### Automatic

Just run:

```
make requirements
```

### Manual

Install dependencies:
* PHP 7.4
* Composer
* NPM
* Serverless framework

Install PHP libraries (bref):

```
composer install --prefer-dist --optimize-autoloader --no-dev
``` 

## Deploy

```
make deploy
```

## Run local 

This will start a Docker service with a PHP 7.4 image, and will expose the service through port 8080.

```
make run-local
```
