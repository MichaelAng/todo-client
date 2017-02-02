#!/bin/bash
# The gcloud-set-config shell script sets the gcloud default parameters.
# This is necessary to point to the correct project, zone, and cluster
# This shell script is to be used in conjunction with circle.yml.
#
# To use this file:
# ./gcloud-set-config.sh

# Exit on any error
set -e

# Detects the current branch to determine which cluster environment to point to.
if [ $CIRCLE_BRANCH = 'develop' ]; then
    CLUSTER_NAME_ENV=$CLUSTER_NAME-develop
elif [ $CIRCLE_BRANCH = 'master' ]; then
    CLUSTER_NAME_ENV=$CLUSTER_NAME-production
else
    CLUSTER_NAME_ENV=$CLUSTER_NAME
fi

# Sets the default gcloud configurations
sudo /opt/google-cloud-sdk/bin/gcloud config set project $PROJECT_NAME
sudo /opt/google-cloud-sdk/bin/gcloud --quiet config set container/cluster $CLUSTER_NAME_ENV
sudo /opt/google-cloud-sdk/bin/gcloud config set compute/zone $CLOUDSDK_COMPUTE_ZONE
sudo /opt/google-cloud-sdk/bin/gcloud --quiet container clusters get-credentials $CLUSTER_NAME_ENV
