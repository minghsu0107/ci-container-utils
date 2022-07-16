#!/bin/sh

# exit if a command fails
set -e

export KUBE_CLUSTER=${KUBE_CLUSTER:-""}
export KUBE_SERVER=${KUBE_SERVER:-""}
export KUBE_SA=${KUBE_SA:-""}
# authenticate by serviceacount token
export KUBE_SA_TOKEN=${KUBE_SA_TOKEN:-""}
# path of CA file of the cluster; CA file should be mounted to this container
export KUBE_CA_PATH=${KUBE_CA_PATH:-""}
export KUBE_CONTEXT=${KUBE_CONTEXT:-"${KUBE_CLUSTER}.k8s.local"}

kubectl config set-cluster ${KUBE_CLUSTER} \
        --server=${KUBE_SERVER} \
        --certificate-authority=${KUBE_CA_PATH} \
        --embed-certs=true;

kubectl config set-credentials ${KUBE_SA} \
        --token=${KUBE_SA_TOKEN};

kubectl config set-context ${KUBE_CONTEXT} \
        --cluster=${KUBE_CLUSTER} \
        --user=${KUBE_SA};

kubectl config use-context ${KUBE_CONTEXT};