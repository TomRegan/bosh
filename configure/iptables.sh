#! /usr/bin/env bash

natforward() {
    info "Enabling NAT forwarding for $1"
    echo 1 > /proc/sys/net/ipv4/ip_forward
    directive="-A POSTROUTING -s $1 -o eth0 -j MASQUERADE"
    iptables-save | grep -- "$directive" 2>&1 >/dev/null || {
	info "Adding firewall rule"
	iptables -t nat $directive
    } ||  info "Firewall rule already exists"
    info "NAT forwarding enabled for $1"

}
