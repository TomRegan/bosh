#! /usr/bin/env bash

[[ $(gem list "$1" -i) != true ]] && {
    gem install "$1"
} || {
    echo "$1 is already installed"
}
