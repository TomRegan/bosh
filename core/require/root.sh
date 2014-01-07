#! /usr/bin/env bash

[[ $UID != 0 ]] && {
	fail "This script needs to run as root"
	exit 1
}
