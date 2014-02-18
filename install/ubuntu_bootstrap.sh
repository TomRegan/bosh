#!/usr/bin/env bash

info "Updating packages"
require root; apt-get update 2>&1 > /dev/null || {
    warn "Package update failed"
}
package native build-essential
package native git
package native unzip
