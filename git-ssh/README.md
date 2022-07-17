# Git SSH

Docker image that helps using git with SSH.

## Usage

```bash
export REPO_URL=git@github.com:minghsu0107/update-kustomization.git
export SSH_KEY_PATH=/tmp/id_rsa
docker run --rm \
-v $HOME/.ssh/id_rsa:$SSH_KEY_PATH \
-e SSH_KEY_PATH=$SSH_KEY_PATH \
-e GIT_HOST=github.com \
minghsu0107/git-ssh:latest "-c" "ssh-auth.sh; git clone $REPO_URL; ls"
```
