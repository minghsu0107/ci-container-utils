#!/bin/sh

# exit if a command fails
set -e

gcloud auth activate-service-account --key-file $GCLOUD_JSON_FILE
# register all Google-supported Docker registries
# credential file path: $HOME/.docker/config.json (/root/.docker/config.json)
gcloud auth configure-docker --quiet

# setup kubecfg
if [ ! -z "$GKE_REGION" ]; then
    gcloud container clusters \
           get-credentials $GKE_CLUSTER \
           --region $GKE_REGION \
           --project $GCP_PROJECT; \
    kubectl config use-context gke_${GCP_PROJECT}_${GKE_REGION}_${GKE_CLUSTER}; \
else
    gcloud container clusters \
           get-credentials $GKE_CLUSTER \
           --zone $GKE_ZONE \
           --project $GCP_PROJECT; \
    kubectl config use-context gke_${GCP_PROJECT}_${GKE_ZONE}_${GKE_CLUSTER}; \
fi
