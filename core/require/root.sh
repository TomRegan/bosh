#! /usr/bin/env bash

[[ $UID != 0 ]] && {
	fail "This script needs to "\
"$(tput smul)${COLOUR_RED}run as root${COLOUR_RESET}$(tput rmul)"
	exit 1
}
