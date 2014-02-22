#! /usr/bin/env bash

require root

[[ $OS == 'ubuntu' ]] && {
    fname=/etc/apt/sources.list
    codename=$(lsb_release -c | cut -f 2)
    grep 'deb.torproject.org/torproject.org' $fname 2>&1 > /dev/null && {
	skip "Tor repository is already installed"
    } || {
	info "Installing the tor repository"
	echo "deb     http://deb.torproject.org/torproject.org $codename main" >> $fname
	gpg --keyserver keys.gnupg.net --recv 886DDD89
	gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
	apt-get update 2>&1 > /dev/null
    }
} || {
    info "$OS is not supported"
}

package native tor
package native tor-arm
