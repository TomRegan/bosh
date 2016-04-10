#! /usr/bin/env bash

MSG="This script will only run on"
[[ $1 == osx && $(uname -s) != Darwin ]] && {
    echo "$MSG OS X"
    exit 1
}
[[ $(grep -i $1 /etc/os-release > /dev/null 2>&1) != 0 ]] && {
    echo "$MSG $1"
    exit 1
}
