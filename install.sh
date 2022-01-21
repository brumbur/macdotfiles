#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source ~/.zshrc-local" >> ~/.zshrc
ln -s $SCRIPT_DIR/.zshrc-local ~/.zshrc-local

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -f $SCRIPT_DIR/Brewfile && brew bundle --file=~$SCRIPT_DIR/Brewfile || source ./brew-packages.sh

# options

# antigen -> all plugins already configured in .zshrc-local
curl -L git.io/antigen > antigen.zsh

# colorls (to show file icons, etc.) or just use exa
gem install colorls

# close the ssh-agent on shell exit >> todo: verify it works
echo "trap 'test -n \"$SSH_AUTH_SOCK\" && eval `/usr/bin/ssh-agent -k`' 0" >> ~/.zprofile

# ssh keys
# git config
# pip config
# aws config