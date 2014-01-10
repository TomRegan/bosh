#! /usr/bin/env bash

[[ $OS == 'darwin' ]] && {
    brew list "$1" > /dev/null 2>&1 && {
	info "$1 is already installed"
    } || {
	[[ $(whoami) != $(logname) ]] && sudo -u $(logname) brew install "$@"
    } || {
	warn "Trying to detect whether $1 is installed caused an error"
    }
} || {
    fail "Package installation is not supported on $OS"
    exit
}
