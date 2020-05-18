FROM php:7.3.6-fpm-alpine3.9


RUN apk add mysql-client \
    && docker-php-ext-install pdo pdo_mysql \
    && rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY app /var/www
WORKDIR /var/www

RUN ln -s public html

EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]