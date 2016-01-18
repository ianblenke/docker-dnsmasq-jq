# WAT

Dnsmasq + jq

a dns forwarding container

# HOW

Specify a set of domains to map to ips and ports like so:
`DOMAIN_JSON='{"local":"127.0.0.1@50053", "*": "8.8.8.8"}'`

The above config would send anything with a `.local` domain to 127.0.0.1 on
port 50053, while any other requests would go to 8.8.8.8

Specify all you like. Keep it simple, bruh
