#!/usr/bin/env bash

[[ -f $2 ]] || {
    info "Downloading ${1#*/}"
    curl -L $1 -o $2 || {
	fail "An error happened downloading ${1#*/}"
	exit 1
    }
}
