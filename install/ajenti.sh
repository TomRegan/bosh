#! /usr/bin/env bash

require root
require os fedora

[[ $(yum info ajenti|grep ': installed') == 1 ]] && {
	echo "Ajenti is already installed"
	exit 0
}
echo "Downloading an RPM..."
rpm -Uvh http://repo.ajenti.org/ajenti-repo-1.0-1.noarch.rpm
echo "Installing ajenti"
yum install -y ajenti
echo "Starting ajenti service"
service ajenti restart
