#!/usr/bin/env bash

[ ! -f ./packages_updated ] && {
    info "Updating packages"
    require root; apt-get update 2>&1 > /dev/null || {
	warn "Package update failed"
    }
    touch ./packages_updated
}
package native build-essential
package native git
package native unzip
