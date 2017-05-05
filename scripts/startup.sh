#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s
# To execute `./scripts/startup.sh v1`
# Exit on any error
set -e

( cd client; npm install )
( cd client; npm install )
( cd client; ng build --prod --output-path="../webserver/dist" )

docker build -t angmerica/todo-client:api-develop-$1 api/
docker build -t angmerica/todo-client:webserver-develop-$1 webserver/

docker push angmerica/todo-client:api-develop-$1
docker push angmerica/todo-client:webserver-develop-$1

kubectl create --save-config -f kubeyaml/api-service.yml
kubectl create --save-config -f kubeyaml/mongo-service.yml
kubectl create --save-config -f kubeyaml/webserver-service.yml

kubectl create --save-config -f kubeyaml/mongo-deployment.yml
sleep 15s

CIRCLE_SHA1=$1 envsubst '${CIRCLE_SHA1}' < kubeyaml/api-deployment.yml > kubeyaml/api-deployment-envvar.yml
kubectl create --save-config -f kubeyaml/api-deployment-envvar.yml
rm kubeyaml/api-deployment-envvar.yml

CIRCLE_SHA1=$1 envsubst '${CIRCLE_SHA1}' < kubeyaml/webserver-deployment.yml > kubeyaml/webserver-deployment-envvar.yml
kubectl create --save-config -f kubeyaml/webserver-deployment-envvar.yml
rm kubeyaml/webserver-deployment-envvar.yml
