#! /usr/bin/env bash

npm list -g $1 > /dev/null 2>&1 && {
    echo "$1 is already installed"
} || {
    npm install -g $1
}
