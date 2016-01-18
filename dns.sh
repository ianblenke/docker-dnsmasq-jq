#!/bin/bash -e

DOMAIN_JSON=${DOMAIN_JSON:-'{}'}
DNSMASQ_OPTIONS=${DNSMASQ_OPTIONS}

function configure() {
  cat << EOF > /etc/dnsmasq.conf
user=root
$(jq '. as $servers|keys[]|. as $domain|"server=/"+$domain+"/"+$servers[$domain]' -r)
EOF
}

function run() {
  exec dnsmasq -k $DNSMASQ_OPTIONS
}

echo $DOMAIN_JSON | configure
run
