#! /usr/bin/env bash

if [[ $OS == 'darwin' ]]; then
    info "I am running on a Mac!"
else
    info "I am running on $OS"
fi

install test
configure openvpn as server
info "Nothing else to do"
