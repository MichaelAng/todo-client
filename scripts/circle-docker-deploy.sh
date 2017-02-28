#!/bin/bash
# The circle docker deploy shell script deploys docker images
# The purpose is so CircleCI can automatically push the docker images
# This shell script can be used in conjunction with circle.yml or to used to deploy manually.
# This assumes you are in the correct branch you want to deploy in.
#
# To use this file from the root context:
# $ git checkout master && CIRCLE_BRANCH=master ./scripts/circle-docker-deploy.sh
# $ git checkout staging && CIRCLE_BRANCH=staging ./scripts/circle-docker-deploy.sh
# $ git checkout develop && CIRCLE_BRANCH=develop ./scripts/circle-docker-deploy.sh

# Exit on any error
set -e

if [ $CIRCLE_BRANCH = 'master' ]; then
    docker push angmerica/todo-client:api-production
    docker push angmerica/todo-client:client-production
    docker push angmerica/todo-client:webserver-production
elif [ $CIRCLE_BRANCH = 'staging' ]; then
    docker push angmerica/todo-client:api-staging
    docker push angmerica/todo-client:client-staging
    docker push angmerica/todo-client:webserver-staging
elif [ $CIRCLE_BRANCH = 'develop' ]; then
    docker push angmerica/todo-client:api-develop
    docker push angmerica/todo-client:client-develop
    docker push angmerica/todo-client:webserver-develop
fi
