FROM alpine

RUN apk add --update dnsmasq jq bash

COPY dns.sh /

ENV DOMAIN_JSON='{"local":"127.0.0.1@50053", "*": "8.8.8.8"}'

CMD /dns.sh
