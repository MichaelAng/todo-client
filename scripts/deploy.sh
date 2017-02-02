#!/bin/bash
# The deploy shell script updates the application's environment cluster google container engine.
# The purpose is so CircleCI can automatically update a cluster container once the build process succeeds
# This shell script is to be used in conjunction with circle.yml.
#
# Known Issues:
# The pod will NOT fetch the latest docker image. This creates the preception that the pod did NOT get
# refreshed, when in fact it did; it used a stale docker image. To correct the problem, you will need
# to manually refresh the pod.
#
# To use this file:
# ./deploy.sh [Pass in docker build image]

# Exit on any error
set -e

# This command gives the ubuntu system's kube permissions.  This allows us to use the kubectl cli
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
# This tells the container cluster's to use the latest image.
kubectl patch deployment $PROJECT_NAME -p '{"spec":{"template":{"spec":{"containers":[{"name":"'$PROJECT_NAME'","image":"'$1'", "imagePullPolicy":"Always"}]}}}}'
