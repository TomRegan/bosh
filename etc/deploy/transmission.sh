#! /usr/bin/env bash

package native transmission-daemon

SHORT_NAME=trc
NAME=transmission-remote-cli
INSTALL_DIR=/usr/local/share
package github 'fagga/transmission-remote-cli' $INSTALL_DIR
chmod -R a+rw $INSTALL_DIR/$NAME
[[ ! -h /usr/local/bin/$SHORT_NAME ]] && {
    ln -s /$INSTALL_DIR/$NAME/$NAME /usr/local/bin/$SHORT_NAME
}
