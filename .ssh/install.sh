#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

brew install openssh
$ export PATH=$(brew --prefix openssh)/bin:$PATH

# ssh config docs: https://man.openbsd.org/ssh_config.5
# check also /etc/ssh/ssh_config

# just copy hte template file to help create the actual one
[[ ! -d ~/.ssh ]] && mkdir -m 600 ~/.ssh && cp $SCRIPT_DIR/config.tmpl ~/.ssh
