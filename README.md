# Scripts for debug nginx configuration

Helpful scripts for autoreload nginx in docker when your configurations in
conf/ dir has been modified

## Requirements

Install `fswatch` and `watch`

    brew install fswatch
    brew install watch
    brew install mitmproxy

## Running

    ./run-nginx.sh
    ./run-reload.sh
    vi conf/nginx.conf.template
