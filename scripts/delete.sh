#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s
# To execute `./scripts/delete.sh`
# Exit on any error
set -e

kubectl delete service api mongo webserver
kubectl delete deployment api mongo webserver
