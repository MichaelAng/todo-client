#!/bin/bash
# The circle docker deploy shell script builds docker images
# The purpose is so CircleCI can automatically build the docker images
# This shell script can be used in conjunction with circle.yml or to used to deploy manually.
# This assumes you are in the correct branch you want to build in.
#
# To use this file from the root context:
# $ git checkout master && CIRCLE_BRANCH=master ./scripts/circle-docker-build.sh
# $ git checkout staging && CIRCLE_BRANCH=staging ./scripts/circle-docker-build.sh
# $ git checkout develop && CIRCLE_BRANCH=develop ./scripts/circle-docker-build.sh

# Exit on any error
set -e

if [ ! -z "$CIRCLE_USERNAME" ]; then
    HOMEPATH=$HOME/todo-client
else
    HOMEPATH=.
fi

if [ $CIRCLE_BRANCH = 'master' ]; then
    docker build -t angmerica/todo-client:api-production $HOMEPATH/api/
    docker build -f $HOMEPATH/client/Dockerfile.production -t angmerica/todo-client:client-production $HOMEPATH/client/
    docker build -f $HOMEPATH/webserver/Dockerfile.production -t angmerica/todo-client:webserver-production $HOMEPATH/webserver/
elif [ $CIRCLE_BRANCH = 'staging' ]; then
    docker build -t angmerica/todo-client:api-staging $HOMEPATH/api/
    docker build -f $HOMEPATH/client/Dockerfile.staging -t angmerica/todo-client:client-staging $HOMEPATH/client/
    docker build -f $HOMEPATH/webserver/Dockerfile.staging -t angmerica/todo-client:webserver-staging $HOMEPATH/webserver/
else
    docker build -t angmerica/todo-client:api-develop $HOMEPATH/api/
    docker build -f $HOMEPATH/client/Dockerfile.develop -t angmerica/todo-client:client-develop $HOMEPATH/client/
    docker build -f $HOMEPATH/webserver/Dockerfile.develop -t angmerica/todo-client:webserver-develop $HOMEPATH/webserver/
fi
