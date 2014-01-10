#! /usr/bin/env bash

[[ $OS == 'darwin' ]] && {
    brew list "$1" > /dev/null 2>&1 && {
	info "$1 is already installed"
    } || {
	[[ $(whoami) != $(logname) ]] && sudo -u $(logname) brew install "$@"
	success "Installed $1"
    } || {
	warn "Trying to detect whether $1 is installed caused an error"
    }
} || {
    [[ $OS == 'ubuntu' ]] &&  {
	require root
	apt-cache policy $1 | grep 'Installed: (none)' > /dev/null 2>&1 && {
	    apt-get install -y $1
	    success "Installed $1"
	} || {
	    info "$1 is already installed"
	}
    } || {
	fail "Package installation is not supported on $OS"
	exit 1
    }
}
