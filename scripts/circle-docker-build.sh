#!/bin/bash
# The circle-docker-build shell script builds docker images
# The purpose is so CircleCI can automatically build the docker images
# This shell script can be used in conjunction with circle.yml.

# Exit on any error
set -e

HOMEPATH=$HOME/todo-client

if [ $CIRCLE_BRANCH = 'master' ]; then
    docker build -t angmerica/todo-client:api-production $HOMEPATH/api/
    docker build -t angmerica/todo-client:client-production $HOMEPATH/client/
    docker build -t angmerica/todo-client:webserver-production $HOMEPATH/webserver/
elif [ $CIRCLE_BRANCH = 'staging' ]; then
    docker build -t angmerica/todo-client:api-staging $HOMEPATH/api/
    docker build -t angmerica/todo-client:client-staging $HOMEPATH/client/
    docker build -t angmerica/todo-client:webserver-staging $HOMEPATH/webserver/
else
    docker build -t angmerica/todo-client:api-develop $HOMEPATH/api/
    docker build -t angmerica/todo-client:client-develop $HOMEPATH/client/
    docker build -t angmerica/todo-client:webserver-develop $HOMEPATH/webserver/
fi
