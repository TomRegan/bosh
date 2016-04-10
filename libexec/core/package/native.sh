#! /usr/bin/env bash

DEBIAN_OS=(
    ubuntu
    raspbian
)

[[ $OS == 'darwin' ]] && {
    brew list "$1" > /dev/null 2>&1 || brew cask list "$1" > /dev/null 2>&1 && {
        skip "$1 is already installed"
    } || {
        [[ $(whoami) != $(logname) ]] && {
            sudo -u $(logname) brew install "$@" > /dev/null 2>&1 || {
                sudo -u $(logname) brew cask install  "$@" > /dev/null 2>&1
            }
        } || {
            brew install "$@" > /dev/null 2>&1 || {
                brew cask install > /dev/null 2>&1 "$@"
            }
        }
        success "Installed $1"
    } || {
        warn "Trying to detect whether $1 is installed caused an error"
    }
} || {
    [[ ${DEBIAN_OS[@]/$OS} != ${DEBIAN_OS[@]} ]] &&  {
        require root
        apt-cache policy $1 | grep 'Installed: (none)' > /dev/null 2>&1 && {
            apt-get install -y $1 && success "Installed $1"
        } || {
            skip "$1 is already installed"
        }
    } || {
        fail "Package installation is not supported on $OS"
        exit 1
    }
}
