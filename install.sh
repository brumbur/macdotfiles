#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -f "$SCRIPT_DIR/Brewfile" && brew bundle --file=~"$SCRIPT_DIR/Brewfile"


# -----------------------
# zprofile customizations
# -----------------------

# close the ssh-agent on shell exit >> todo: verify it works
echo 'trap ''test -n \"$SSH_AUTH_SOCK\" && eval `/usr/bin/ssh-agent -k`'' 0' >> ~/.zprofile

# source custom vars and paths
ln -s $SCRIPT_DIR/shell/.zshrc-local ~/.zshrc-local
echo "source ~/.zprofile-local" >> ~/.zprofile


# --------------------
# custom shell options
# --------------------

# antigen
curl -L git.io/antigen > antigen.zsh
# all antigen plugins already configured in .zshrc-local
ln -s $SCRIPT_DIR/.zshrc-local ~/.zshrc-local
echo "source ~/.zshrc-local" >> ~/.zshrc

# hyper
$SCRIPT_DIR/hyper/install.sh

# brew - optional packages
test -f "$SCRIPT_DIR/Brewfile.optional" && brew bundle --file=~$SCRIPT_DIR/Brewfile.optional"

# colorls @update: no longer needed, using exa now
# gem install colorls

# ssh
$SCRIPT_DIR/.ssh/install.sh
# git config
# pip config
# aws config