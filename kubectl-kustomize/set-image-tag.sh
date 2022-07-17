#!/bin/sh

# exit if a command fails
set -e

export IMAGES=${IMAGES:-""}
export IMAGE_TAG=${IMAGE_TAG:-"latest"}

for IMAGE in $(echo $IMAGES | sed "s/,/ /g")
do
    kustomize edit set image $IMAGE:$IMAGE_TAG
done