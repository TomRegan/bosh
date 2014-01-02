#! /usr/bin/env bash

MSG="This script will only run on"
[[ $2 == osx && $(uname -s) != Darwin ]] && {
    echo "$MSG OS X"
    exit 1
}
[[ $(grep -i $2 /etc/os-release > /dev/null 2>&1) != 0 ]] && {
    echo "$MSG $2"
    exit 1
}
