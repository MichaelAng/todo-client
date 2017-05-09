#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s
# To execute `./scripts/update-minikube.sh v2`
# Exit on any error
set -e

( cd client; npm install )
( cd client; npm install )
( cd client; ng build --prod --output-path="../webserver/dist" )

docker build -t localhost:5000/my-app:api-develop-$1 api/
docker build -t localhost:5000/my-app:webserver-develop-$1 webserver/

docker push localhost:5000/my-app:api-develop-$1
docker push localhost:5000/my-app:webserver-develop-$1

IMAGE_REPO=localhost:5000/my-app: IMAGE_TAG=api-develop- CIRCLE_SHA1=$1 envsubst '${IMAGE_REPO},${IMAGE_TAG},${CIRCLE_SHA1}' < kubeyaml/api-deployment.yml > kubeyaml/api-deployment-envvar.yml
kubectl apply -f kubeyaml/api-deployment-envvar.yml --record
rm kubeyaml/api-deployment-envvar.yml

IMAGE_REPO=localhost:5000/my-app: IMAGE_TAG=webserver-develop- CIRCLE_SHA1=$1 envsubst '${IMAGE_REPO},${IMAGE_TAG},${CIRCLE_SHA1}' < kubeyaml/webserver-deployment.yml > kubeyaml/webserver-deployment-envvar.yml
kubectl apply -f kubeyaml/webserver-deployment-envvar.yml --record
rm kubeyaml/webserver-deployment-envvar.yml
