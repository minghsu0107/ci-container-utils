#!/bin/sh

set -e

export VAULT_ADDR=${VAULT_ADDR:-"http://127.0.0.1:8200"}
export WORKDIR=${WORKDIR:-"./"}

cd $WORKDIR

for file in "$@"
do
    echo "decrypt file $file ..."
    consul-template -once -vault-addr ${VAULT_ADDR} -template "$file:$file"
done
