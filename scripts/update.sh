#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s
# To execute `./scripts/update.sh v2`
# Exit on any error
set -e

( cd client; npm install )
( cd client; npm install )
( cd client; ng build --prod --output-path="../webserver/dist" )

docker build -t angmerica/todo-client:api-develop-$1 api/
docker build -t angmerica/todo-client:webserver-develop-$1 webserver/

docker push angmerica/todo-client:api-develop-$1
docker push angmerica/todo-client:webserver-develop-$1

CIRCLE_SHA1=$1 envsubst '${CIRCLE_SHA1}' < kubeyaml/api-deployment.yml > kubeyaml/api-deployment-envvar.yml
kubectl apply -f kubeyaml/api-deployment-envvar.yml --record
rm kubeyaml/api-deployment-envvar.yml

CIRCLE_SHA1=$1 envsubst '${CIRCLE_SHA1}' < kubeyaml/webserver-deployment.yml > kubeyaml/webserver-deployment-envvar.yml
kubectl apply -f kubeyaml/webserver-deployment-envvar.yml --record
rm kubeyaml/webserver-deployment-envvar.yml
