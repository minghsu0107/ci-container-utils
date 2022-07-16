FROM alpine:3.14.2

WORKDIR /

RUN apk update && \
    apk add --no-cache git && \
    apk add --no-cache openssh

ADD *.sh /bin/

RUN chmod +x /bin/*.sh

ENTRYPOINT ["/bin/sh"]