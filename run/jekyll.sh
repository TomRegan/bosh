#! /usr/bin/env bash

[[ $(gem list jekyll -i) != true ]] && {
    gem install jekyll    
} || {
    echo "jekyll is already installed"
}
