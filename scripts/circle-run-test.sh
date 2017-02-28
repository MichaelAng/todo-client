#!/bin/bash
# The circle-run-test shell script tests the docker images
# The purpose is so CircleCI can automatically test the docker images
# This shell script can be used in conjunction with circle.yml or to used to test images manually.
# This assumes you are in the correct branch you want to test in.
#
# To use this file from the root context:
# $ git checkout master && CIRCLE_BRANCH=master ./scripts/circle-run-test.sh
# $ git checkout staging && CIRCLE_BRANCH=staging ./scripts/circle-run-test.sh
# $ git checkout develop && CIRCLE_BRANCH=develop ./scripts/circle-run-test.sh

# Exit on any error
set -e

if [ $CIRCLE_BRANCH = 'master' ]; then
    docker run -it --rm -w /usr/src/app angmerica/todo-client:client-production npm run lint
    docker run -it --rm -w /usr/src/app angmerica/todo-client:client-production npm run test -- --browser PhantomJS --single-run
elif [ $CIRCLE_BRANCH = 'staging' ]; then
    docker run -it --rm -w /usr/src/app angmerica/todo-client:client-staging npm run lint
    docker run -it --rm -w /usr/src/app angmerica/todo-client:client-staging npm run test -- --browser PhantomJS --single-run
else
    docker run -it --rm -w /usr/src/app angmerica/todo-client:client-develop npm run lint
    docker run -it --rm -w /usr/src/app angmerica/todo-client:client-develop npm run test -- --browser PhantomJS --single-run
fi
