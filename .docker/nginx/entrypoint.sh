#!/bin/sh

dockerize -template /docker/nginx.template:/etc/nginx/conf.d/nginx.conf
nginx -g 'daemon off;'