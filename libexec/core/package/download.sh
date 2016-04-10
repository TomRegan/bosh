#!/usr/bin/env bash


URL=$1
FILE=$2
[ ! -f $FILE ] && {
    info "Downloading $URL ($FILE)"
    curl -L "$URL" -o "$FILE" || {
	fail "An error happened downloading $FILE"
	exit 1
    }
    info "Successfully downloaded '$FILE'"
} || {
    warn "'$FILE' already exists and will not be downloaded"
    info $(pwd)
    info ls -a
}
