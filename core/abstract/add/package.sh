#! /usr/bin/env bash

brew list "$1" > /dev/null 2>&1 && {
    echo "$1 is already installed"
} || {
    brew install "$1"
}
