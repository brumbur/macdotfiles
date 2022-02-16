#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

brew install openssh
export PATH=$(brew --prefix openssh)/bin:$PATH