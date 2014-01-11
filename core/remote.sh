#! /usr/bin/env bash

[[ $# -ge 2 ]] && {
    info "Running '$2' on ${1#*@}"
    cd $COBBLER_HOME
    tar --exclude=".*" -czf - -C $COBBLER_HOME * | ssh $1 \
"export TERM=xterm-256color;"\
"export COBBLER_HOME=~/cobbler;"\
"export COBBLER_REMOTE=${1#*@};"\
"mkdir -p cobbler;"\
"tar xfz - -C cobbler;"\
"[[ -f cobbler/cobbler ]] && cobbler/cobbler $2" || {
        fail "Remote script '$2' failed on ${1#*@}"
        exit
    }
} || {
    fail "Expected a valid hostname and script"
    exit
}
success "Remote script '$2' completed on ${1#*@}"
