#! /usr/bin/env bash

[[ $UID != 0 ]] && {
	echo "Must be run as root to install packages"
	exit 1
}
