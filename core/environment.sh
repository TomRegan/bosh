#! /usr/bin/env bash

lowercase() {
    echo $@ | tr A-Z a-z
}

UNAME=$(uname -s)
[[ $UNAME != 'Linux' ]] && {
    _OS=$UNAME
} || {
    _OS=$(sed -n -e 's/^ID=//p' /etc/os-release)
}
export OS=$(lowercase $_OS)
