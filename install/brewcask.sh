#!/usr/bin/env bash

brew tap phinze/cask && brew install brew-cask || {
    fail "Failed to install brew-cask"
    exit 1
}
info "Installed brew-cask"
