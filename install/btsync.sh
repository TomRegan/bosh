#! /usr/bin/env bash

require root

INSTALL_LOCATION=/usr/local/bin
[ -f $INSTALL_LOCATION/btsync ] && {
    info "btsync is already installed"
    exit 0
}

if [[ $(uname -s) == "Linux" ]]; then
    if [[ $ARCH == "x86_64" ]]; then
	ARCHIVE=btsync_glibc23_x64.tar.gz
	URL=http://download-lb.utorrent.com/endpoint/btsync/os/linux-glibc23-x64/track/stable
    else
	fail "Installation of btsync is not supported on $ARCH $OS systems"
	exit 1
    fi
else
    fail "Installation of btsync is not supported on $ARCH $OS systems"
    exit 1
fi

info "Installing btsync for $ARCH $OS"
package download $URL $INSTALL_LOCATION/$ARCHIVE

info "Unpacking $ARCHIVE"
tar -C $INSTALL_LOCATION -xzf $INSTALL_LOCATION/$ARCHIVE btsync && {
    rm -f $INSTALL_LOCATION/$ARCHIVE
    info "Running btsync"
    chmod +x $INSTALL_LOCATION/btsync
    $INSTALL_LOCATION/btsync
} || {
    fail "An error happened installing btsync for $ARCH $OS"
    exit 1
}
success "Installed btsync for $ARCH $OS"
