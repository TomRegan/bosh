#! /usr/bin/env bash

HANDLER=$1; shift
source $COBBLER_HOME/core/abstract/add/$HANDLER.sh $@
