#!/bin/sh

# exit if a command fails
set -e

export SSH_KEY_PATH=${SSH_KEY_PATH:-""}
export GIT_HOST=${GIT_HOST:-""}

mkdir -p ~/.ssh
cat $SSH_KEY_PATH > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
ssh-keyscan $GIT_HOST >> ~/.ssh/known_hosts
