#! /usr/bin/env bash

[[ $# -ge 2 ]] && {
    info "Running '$2' on ${1#*@}"
    ssh $1 "export TERM=xterm-256color;"\
"export COBBLER_HOME=~/cobbler;"\
"mkdir -p cobbler/;"\
"[[ ! -f cobbler/cobbler && -f cobbler.tgz ]] && tar xfz cobbler.tgz -C cobbler/;"\
"[[ -f cobbler.tgz ]] && rm -f cobbler.tgz;"\
"[[ -f cobbler/cobbler ]] && cobbler/cobbler $2" || {
        fail "Remote script '$2' failed on ${1#*@}"
        exit
    }
} || {
    fail "Expected a valid hostname and script"
    exit
}
