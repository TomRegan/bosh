#! /usr/bin/env bash

[[ $(gem list "$1" -i) != true ]] && {
    info "Installing $1"
    gem install "$1" --no-ri --no-rdoc && success "Installed $1" || {
	fail "Installation of $1 failed"
    }
} || {
    skip "$1 is already installed"
}
