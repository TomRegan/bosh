#!/usr/bin/env bash

brew tap phinze/cask || {
    fail "Failed to install brew-cask"
    exit 1
}

package native brew-cask
