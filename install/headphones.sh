#!/usr/bin/env bash

require root

INSTALL_DIR=/usr/local/share
SERVICE_TARGET=$INSTALL_DIR/headphones/init.$OS
SERVICE=/etc/init.d/headphones
SERVICE_CONF=/etc/default/headphones

package github 'rembo10/headphones' $INSTALL_DIR && {
    adduser --system --no-create-home headphones 2>&1 > /dev/null
    chown headphones:nogroup -R $INSTALL_DIR/headphones/
    chmod -R +rw $INSTALL_DIR/headphones/
    [[ -f $SERVICE_TARGET ]] && {
	chmod +x $SERVICE_TARGET
	ln -s $SERVICE_TARGET $SERVICE
    }
    [[ ! -f $SERVICE_CONF ]] && {
	cat > $SERVICE_CONF <<EOF
# Written by Bosh on $(date -u)
HP_HOME=$INSTALL_DIR/headphones/
HP_DATA=$INSTALL_DIR/headphones/
EOF
info "Wrote headphones service configuration to $SERVICE_CONF"
    } || {
	skip "Headphones configuration already exists in $SERVICE_CONF"
    }
    info "Now start headphones with 'service headphones start'"
}
