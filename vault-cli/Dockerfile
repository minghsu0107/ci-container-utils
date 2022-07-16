FROM hashicorp/consul-template:0.23.0-alpine

USER root

RUN apk update && \
    apk add --no-cache vault ca-certificates curl && \
    echo "====> Changing vault owner to root..." && \
    chown root:root /usr/sbin/vault

COPY vault-login.sh /bin/vault-login

RUN chmod +x /bin/vault-*

ENTRYPOINT ["/bin/sh"]
