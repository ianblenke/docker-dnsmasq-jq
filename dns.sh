#!/bin/bash -e

DOMAIN_JSON=${DOMAIN_JSON:-'{}'}
# by default send queries to all servers that can reply
DNSMASQ_OPTIONS=${DNSMASQ_OPTIONS:---all-servers}

function configure() {
  cat << EOF > /etc/dnsmasq.conf
user=root
$(jq '. as $servers|keys[]|. as $domain|$servers[$domain][]|"server=/"+$domain+"/"+.' -r)
EOF
}

function run() {
  exec dnsmasq -k $DNSMASQ_OPTIONS
}

echo $DOMAIN_JSON | configure
run
