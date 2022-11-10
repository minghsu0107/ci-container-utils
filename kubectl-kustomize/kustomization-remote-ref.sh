#!/bin/sh

# exit if a command fails
set -e

export KUSTOMIZATION=${KUSTOMIZATION:-""}
export MANIFEST_SSH_URL=${MANIFEST_SSH_URL:-""}
export MANIFEST_BRANCH=${MANIFEST_BRANCH:-"main"}
export MANIFEST_USER=${MANIFEST_USER:-""}
export MANIFEST_USER_EMAIL=${MANIFEST_USER_EMAIL:-""}
export REF=${REF:-""}

ssh-auth.sh
git clone $MANIFEST_SSH_URL /manifest && cd /manifest
git checkout $MANIFEST_BRANCH
cd $KUSTOMIZATION

set-image-tag.sh
yq '.resources[0]' kustomization.yaml > /tmp/input.txt
REMOTE_URL=`cut -d'?' -f1 /tmp/input.txt`
yq -i '.resources[0] = "'$REMOTE_URL'?ref='$REF'"' kustomization.yaml

git config --global user.name $MANIFEST_USER
git config --global user.email $MANIFEST_USER_EMAIL
git add . && git commit --allow-empty -m "🚀 update to ${IMAGE_TAG}"
git push $MANIFEST_SSH_URL
