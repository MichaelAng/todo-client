#!/bin/bash
# The circle-run-test shell script tests the docker images
# The purpose is so CircleCI can automatically test the docker images
# This shell script can be used in conjunction with circle.yml.

# Exit on any error
set -e

ng test --watch=false

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
