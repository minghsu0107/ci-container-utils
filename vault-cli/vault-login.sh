#!/bin/sh

# exit if a command fails
set -e

export VAULT_ADDR=${VAULT_ADDR:-"http://127.0.0.1:8200"}
export VAULT_APPROLE=${VAULT_APPROLE:-""}
export VAULT_APPROLE_SECRET=${VAULT_APPROLE_SECRET:-""}

# Get approle token && login
export APPROLE_TOKEN=$(vault write -field=token \
                     auth/approle/login \
                     role_id="${VAULT_APPROLE}" \
                     secret_id="${VAULT_APPROLE_SECRET}")

vault login -no-print "${APPROLE_TOKEN}"

echo "You are now login as ${VAULT_APPROLE}."
