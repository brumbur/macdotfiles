#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}

brew install hyper
[[ -f $SCRIPT_DIR/customize.sh ]] && source $SCRIPT_DIR/customize.sh