#! /usr/bin/env bash

if [[ $OS == 'darwin' ]]; then
    info "I am running on a Mac!"
else
    info "I am running on $OS"
fi

install desktop
#install openvpn
#configure openvpn as server
#configure firewall for natforward 10.8.0.0/24
info "Nothing else to do"
