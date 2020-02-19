#!/bin/bash

CURDIR=$(dirname "$(realpath "$0")");
# shellcheck source=.functions
source "${CURDIR}/.functions"

RELOADED=$(_greenb "Reloaded")

_title "Configure reload nginx when change file in conf/*"

fswatch -e "nginx.conf$" -0 ${CURDIR}/conf/* | xargs -0 -n 1 -I{} bash -c \
  "cat \"$CURDIR/conf/nginx.conf.template\" | sed \"s#{{BACKEND}}#$PROXY_URL#g\" > \"$CURDIR/conf/nginx.conf\"\
  && docker kill --signal=1 $NGINX_DOCKER_IMAGE_NAME >/dev/null 2>&1 && echo \"$RELOADED\""

_done
