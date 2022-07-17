# Kubectl Kustomize
## Usage
Kustomize with SSH remote bases:
```bash
export SSH_KEY_PATH=/tmp/id_rsa
docker run --rm \
-v $HOME/.ssh/id_rsa:$SSH_KEY_PATH \
-e SSH_KEY_PATH=$SSH_KEY_PATH \
-e GIT_HOST=github.com \
-v `pwd`/demo:/demo \
minghsu0107/kubectl-kustomize -c "ssh-auth.sh; kustomize build /demo"
```