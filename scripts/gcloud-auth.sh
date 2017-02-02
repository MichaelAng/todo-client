#!/bin/bash
# The gcloud-auth shell script authenticates the circleCI command as a service application.
# The GCLOUD_SERVICE_KEY environment variable is stored in the todo-client CircleCI environment variable
# This shell script is to be used in conjunction with circle.yml.
#
# To use this file:
# ./gcloud-auth.sh

# Exit on any error
set -e

# Authenticates with Google Cloud Platform
echo $GCLOUD_SERVICE_KEY | base64 --decode -i > ${HOME}/gcloud-service-key.json
sudo /opt/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
