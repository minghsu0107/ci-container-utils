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
Update kustomization:
```bash
export SSH_KEY_PATH=/tmp/id_rsa
docker run --rm \
-v $HOME/.ssh/id_rsa:$SSH_KEY_PATH \
-e SSH_KEY_PATH=$SSH_KEY_PATH \
-e GIT_HOST=github.com \
-e IMAGES=minghsu0107/cicd-demo-ga \
-e IMAGE_TAG=debug \
-e KUSTOMIZATION=overlays/dev \
-e MANIFEST_BRANCH=main \
-e MANIFEST_USER=minghsu0107 \
-e MANIFEST_USER_EMAIL=minghsu0107@gmail.com \
-e MANIFEST_SSH_URL=git@github.com:minghsu0107/cicd-demo-ga-manifests.git \
minghsu0107/kubectl-kustomize -c "kustomization.sh"
```