#!/usr/bin/env bash

INSTALL_DIR=$2
NAME=${1#*/}

[ -d $INSTALL_DIR/$NAME ] && {
    skip "$INSTALL_DIR/$NAME is already installed"
} || {
    info "Installing $NAME"
    which unzip >/dev/null 2>&1 || {
	fail "unzip is required but missing from the system"
	exit 1
    }
    [ -d /tmp ] && cd /tmp
    package download https://github.com/$1/archive/master.zip $NAME.zip
    mkdir -p $INSTALL_DIR
    unzip -qd $INSTALL_DIR/ $NAME.zip
    mv $INSTALL_DIR/$NAME-master $INSTALL_DIR/$NAME
    rm $NAME.zip

    success "Installed $NAME"
}
