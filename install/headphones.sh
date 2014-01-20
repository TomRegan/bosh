#!/usr/bin/env bash

require root

INSTALL_DIR=/usr/local/share

package github 'rembo10/headphones' $INSTALL_DIR

chmod -R a+rw $INSTALL_DIR/headphones
