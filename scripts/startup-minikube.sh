#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s
# To execute `./scripts/startup-minikube.sh v1`
# Exit on any error
set -e

( cd client; npm install )
( cd client; npm install )
( cd client; ng build --prod --output-path="../webserver/dist" )

docker build -t localhost:5000/my-app:api-develop-$1 api/
docker build -t localhost:5000/my-app:webserver-develop-$1 webserver/

docker push localhost:5000/my-app:api-develop-$1
docker push localhost:5000/my-app:webserver-develop-$1

kubectl create --save-config -f kubeyaml/api-service.yml
kubectl create --save-config -f kubeyaml/mongo-service.yml
kubectl create --save-config -f kubeyaml/webserver-service.yml

kubectl create --save-config -f kubeyaml/mongo-deployment.yml
sleep 15s

IMAGE_REPO=localhost:5000/my-app: IMAGE_TAG=api-develop- CIRCLE_SHA1=$1 envsubst '${IMAGE_REPO},${IMAGE_TAG},${CIRCLE_SHA1}' < kubeyaml/api-deployment.yml > kubeyaml/api-deployment-envvar.yml
kubectl create --save-config -f kubeyaml/api-deployment-envvar.yml
rm kubeyaml/api-deployment-envvar.yml

IMAGE_REPO=localhost:5000/my-app: IMAGE_TAG=webserver-develop- CIRCLE_SHA1=$1 envsubst '${IMAGE_REPO},${IMAGE_TAG},${CIRCLE_SHA1}' < kubeyaml/webserver-deployment.yml > kubeyaml/webserver-deployment-envvar.yml
kubectl create --save-config -f kubeyaml/webserver-deployment-envvar.yml
rm kubeyaml/webserver-deployment-envvar.yml
