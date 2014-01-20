#! /usr/bin/env bash

[ -f $COBBLER_HOME/install/${OS}_bootstrap.sh ] && {
    info "including ${OS} bootstrap script"
    install ${OS}_bootstrap
} || {
    warn "no $OS bootstrap script found"
}
install bootstrap
