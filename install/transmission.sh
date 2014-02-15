#! /usr/bin/env bash

package native transmission-daemon

INSTALL_DIR=/usr/local/share
package github 'fagga/transmission-remote-cli' $INSTALL_DIR
chmod -R a+rw $INSTALL_DIR/transmission-remote-cli
