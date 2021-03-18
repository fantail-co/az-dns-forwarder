FROM alpine:3.13

LABEL maintainer="olly@fantail.co" \
org.label-schema.vcs-url="https://github.com/fantail-co/az-dns-forwarder"

ADD named.conf /etc/bind/

RUN apk add --no-cache bind && \
    rm -rf /var/cache/apk/*

EXPOSE 53/udp

ENTRYPOINT ["/usr/sbin/named", "-f", "-g"]
