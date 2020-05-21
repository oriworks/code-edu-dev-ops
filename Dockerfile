FROM php:fpm-alpine

RUN apk add --no-cache openssl mysql-client \
    && docker-php-ext-install pdo pdo_mysql \
    && rm -rf /var/www/html

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./app /var/www
COPY ./.docker/app /docker

WORKDIR /var/www

RUN ln -s public html

EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]