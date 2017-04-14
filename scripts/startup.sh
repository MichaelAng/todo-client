#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s

# Exit on any error
set -e

cd client && npm install && ng build --prod --output-path="../webserver/dist"
cd ..
docker build -t api:v1 api/
docker build -t webserver:v1 webserver/


kubectl create -f config/mongo-deployment.yml
sleep 5s
kubectl create -f config/api-deployment.yml
kubectl create -f config/webserver-deployment.yml

minikube service webserver