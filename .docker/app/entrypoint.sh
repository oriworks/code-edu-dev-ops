#!/bin/sh

dockerize -template /docker/.env.template:/var/www/.env
php-fpm