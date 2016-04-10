#! /usr/bin/env bash

[ -f $BOSH_DEPLOY/${OS}_bootstrap.sh ] && {
    info "including ${OS} bootstrap script"
    install ${OS}_bootstrap
} || {
    warn "no $OS bootstrap script found"
}

package native colordiff
package native emacs
package native maven
package native mosh
package native nmap
package native pass
package native tmux
package native tree
package native unrar
package native irssi
