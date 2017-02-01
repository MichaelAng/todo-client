#!/bin/bash

# Exit on any error
set -e

# sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/hello
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment $PROJECT_NAME -p '{"spec":{"template":{"spec":{"containers":[{"name":"'$PROJECT_NAME'","image":"'$1'"}]}}}}'