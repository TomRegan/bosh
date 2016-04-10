#! /usr/bin/env bash

# install emacs for the terminal if mac,
# or for the gui if this is linux
package native emacs
if [[ $OS == 'darwin' ]]; then
    # install gui emacs
    package native emacs-mac
else
    # install emacs for the terminal
    package native emacs-nox
fi
