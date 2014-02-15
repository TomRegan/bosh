#! /usr/bin/env bash

install bootstrap
install openvpn
configure openvpn as server
configure iptables for natforward 10.8.0.0/24
