#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source ~/.zshrc-custom" >> ~/.zshrc
ln -s $SCRIPT_DIR/.zshrc-custom ~/.zshrc-custom

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -f $SCRIPT_DIR/Brewfile && brew bundle --file=~$SCRIPT_DIR/Brewfile || ./brew-packages.sh


# options

# antigen -> all plugins already configured in .zshrc-custom
curl -L git.io/antigen > antigen.zsh

# colorls (to show file icons, etc.) or just use exa
gem install colorls


# ssh keys
# git config
# pip config
# aws config

