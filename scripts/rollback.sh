#!/bin/bash
# This is really for testing purpose while i figure out how to quickly get this working with k8s
# To execute `./scripts/rollback.sh`
# Exit on any error
set -e

# This allows us to view the history of the rollback
# kubectl rollout history deployment api webserver

# This rolls back the deployment
kubectl rollout undo deployment api webserver
