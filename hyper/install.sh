#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

brew install hyper
[[ -f $SCRIPT_DIR/customize.sh ]] && source $SCRIPT_DIR/customize.sh