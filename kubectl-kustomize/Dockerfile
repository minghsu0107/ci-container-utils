FROM alpine:3.14.2

ENV TARGETOS=linux
ENV TARGETARCH=amd64
ENV KUSTOMIZE_VERSION=v4.5.5
ENV KUSTOMIZE_URL=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_${TARGETOS}_${TARGETARCH}.tar.gz

ENV KUBE_VERSION=v1.20.2
ENV KUBE_URL=https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl

WORKDIR /

RUN apk update && \
    apk add --no-cache curl && \
    apk add --no-cache yq && \
    apk add --no-cache git && \
    curl -fL ${KUBE_URL} -o /bin/kubectl && \
    chmod +x /bin/kubectl && \
    curl -fL ${KUSTOMIZE_URL} | tar xz && \
    chmod +x kustomize && \
    mv kustomize /bin/kustomize

ADD *.sh /bin/

RUN chmod +x /bin/*.sh

ENTRYPOINT ["/bin/sh"]
