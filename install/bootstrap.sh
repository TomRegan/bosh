#! /usr/bin/env bash

[ -f $BOSH_HOME/install/${OS}_bootstrap.sh ] && {
    info "including ${OS} bootstrap script"
    install ${OS}_bootstrap
} || {
    warn "no $OS bootstrap script found"
}

[ -f $BOSH_HOME/configuration/${OS}.sh ] && {
    info "including ${OS} desktop configuration"
    configure ${OS} as desktop
} || {
    warn "no $OS configuration found"
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
