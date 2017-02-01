#!/bin/bash

# Exit on any error
set -e

# Set Google configurations
if [ $CIRCLE_BRANCH = 'develop' ]; then
    CLUSTER_NAME_ENV=$CLUSTER_NAME-develop
elif [ $CIRCLE_BRANCH = 'master' ]; then
    CLUSTER_NAME_ENV=$CLUSTER_NAME-production
else
    CLUSTER_NAME_ENV=$CLUSTER_NAME
fi

sudo /opt/google-cloud-sdk/bin/gcloud config set project $PROJECT_NAME
sudo /opt/google-cloud-sdk/bin/gcloud --quiet config set container/cluster $CLUSTER_NAME_ENV
sudo /opt/google-cloud-sdk/bin/gcloud config set compute/zone $CLOUDSDK_COMPUTE_ZONE
sudo /opt/google-cloud-sdk/bin/gcloud --quiet container clusters get-credentials $CLUSTER_NAME_ENV