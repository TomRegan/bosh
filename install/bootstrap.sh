#! /usr/bin/env bash

package system emacs
package system tree
if [[ $OS == 'ubuntu' ]]; then
    package system build-essential
    package system git
    package system unzip
fi
