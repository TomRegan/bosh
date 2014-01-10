#! /usr/bin/env bash

[[ $# -ge 1 ]] && {
    info "Deploying cobbler to ${1#*@}"
    cd $COBBLER_HOME
    tar --exclude=".*" -czf $COBBLER_HOME/cobbler.tgz -C $COBBLER_HOME *
    scp $COBBLER_HOME/cobbler.tgz $1:~/ > /dev/null 2>&1
    rm -f $COBBLER_HOME/cobbler.tgz
    success "Successfully deployed cobbler to ${1#*@}"
} || {
    fail "Expected a valid hostname"
    exit
}
