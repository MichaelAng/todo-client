#!/bin/sh
# NODE_ENV is the environment. It can accept integration or staging
# KEY is the key you want to unlock the file with
# To use
# NODE_ENV=integration KEY=**** ./startup.sh

# Exit on any error
set -e

[ "${NODE_ENV:=NODE_ENV=development}" ]
if [ $NODE_ENV = "integration" ] || [ $NODE_ENV = "staging" ] || [ $NODE_ENV = "production" ]; then
    nginx -c /etc/nginx/nginx.remote.conf
else
    nginx -c /etc/nginx/nginx.development.conf
fi
