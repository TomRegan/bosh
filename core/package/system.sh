#! /usr/bin/env bash

[[ $OS == 'darwin' ]] && {
    brew list "$1" > /dev/null 2>&1 && {
	echo "$1 is already installed"
    } || {
	brew install "$1"
    }
} || {
    fail "Package installation is not supported on $OS"
}
