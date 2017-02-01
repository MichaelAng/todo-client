#!/bin/bash

# Exit on any error
set -e

sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment $PROJECT_NAME -p '{"spec":{"template":{"spec":{"containers":[{"name":"'$PROJECT_NAME'","image":"'$1'"}]}}}}'