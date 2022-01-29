#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

[[ ! -f ~/Library/KeyBindings/DefaultKeyBinding.Dict ]] && cp $SCRIPT_DIR/KeyBindings ~/Library