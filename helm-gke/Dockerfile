FROM google/cloud-sdk:256.0.0-alpine

ENV HELM_VERSION v3.4.2
ENV HELM_URL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O helm.tar.gz

WORKDIR /

RUN echo "===> Updating & Installing required packages..." && \
    apk update && \
    apk --no-cache add python && \
    \
    \
    echo "===> Installing kubectl..." && \
    CLOUDSDK_CORE_DISABLE_PROMPTS=1 gcloud components install kubectl && \
    \
    \
    echo "===> Installing helm..." && \
    wget ${HELM_URL} -O helm.tar.gz && \
    tar -zxvf helm.tar.gz -C /tmp && \
    mv /tmp/linux-amd64/helm /bin/helm && \
    rm -rf /tmp/* && \
    \
    \
    echo "===> Cleaning up cache..." && \
    rm -rf /var/cache/apk/*

ADD *.sh /bin/

RUN chmod +x /bin/*.sh

ENTRYPOINT ["/bin/sh"]
