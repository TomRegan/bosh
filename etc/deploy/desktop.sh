#!/usr/bin/env bash

[ -f $BOSH_DEPLOY/${OS}_bootstrap.sh ] && {
    info "including ${OS} desktop script"
    install ${OS}_desktop
} || {
    warn "no $OS bootstrap script found"
}
