#!/usr/bin/env bash

warn "This script does not work on linux"
if [[ $(uname -s) == 'Linux' ]]; then
    plaftorm='Linux'
elif [[ $OS == 'darwin' ]]; then
    platform='Mac'
else
    fail "Cannot download Chromium for $OS"
    exit 1
fi

package download "https://download-chromium.appspot.com/dl/$platform" chrome.zip
