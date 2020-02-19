#!/bin/bash

CURDIR=$(dirname "$(realpath "$0")");
# shellcheck source=.functions
source "${CURDIR}/.functions"

_title "Remove old docker image by name"
docker rm $NGINX_DOCKER_IMAGE_NAME;

_title "Run nginx docker container with name - $NGINX_DOCKER_IMAGE_NAME"
cat "$CURDIR/conf/nginx.conf.template" | sed "s#{{BACKEND}}#$PROXY_URL#g" > "$CURDIR/conf/nginx.conf"
docker run -p8080:80 -p8081:81 \
  --name $NGINX_DOCKER_IMAGE_NAME \
  -it \
  -v $PWD/conf/:/local/ \
  nginx:mainline \
  nginx -g "daemon off;" -c /local/nginx.conf

_done
