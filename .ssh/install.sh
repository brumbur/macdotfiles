#!/usr/bin/env zsh
# ssh config docs: https://man.openbsd.org/ssh_config.5
# check also /etc/ssh/ssh_config

# check and create config as needed
[[ ! -f ~/.ssh/config ]]; then
	[[ ! -d ~/.ssh ]] && mkdir -m 600 ~/.ssh


fi

