#! /usr/bin/env bash

[[ $# -ge 2 ]] && {
    info "Running '$2' on ${1#*@}"
    cd $BOSH_HOME
    tar --exclude=".*" -czf - -C $BOSH_HOME * | ssh $1 \
"export TERM=xterm-256color;"\
"export BOSH_HOME=~/bosh;"\
"export BOSH_REMOTE=${1#*@};"\
"mkdir -p bosh;"\
"tar xfz - -C bosh;"\
"[[ -f bosh/bosh ]] && bosh/bosh $2" || {
        fail "Remote script '$2' failed on ${1#*@}"
        exit 1
    }
} || {
    fail "Expected a valid hostname and script"
    exit 1
}
success "Remote script '$2' completed on ${1#*@}"
