FROM php:7.3.6-fpm-alpine3.9


RUN apk add mysql-client \
    && docker-php-ext-install pdo pdo_mysql

RUN rm -rf /var/www/html

WORKDIR /var/www

RUN ln -s public html

EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]