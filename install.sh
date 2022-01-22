#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ARCH_AMD64="i386"
ARCH_ARM64="arm"

ARCH=$(uname -p)

[[ $ARCH == $ARCH_AMD64 ]] && PATH_PREFIX="/usr/local"
[[ $ARCH == $ARCH_ARM64 ]] && PATH_PREFIX="/opt/homebrew"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $($PATH_PREFIX/bin/brew shellenv)' >> ~/.zprofile
source ~/.zprofile
[[ -f $SCRIPT_DIR/homebrew/Brewfile ]] && brew bundle --file=$SCRIPT_DIR/homebrew/Brewfile || "Note: Could not find Bundle file, please install yourself the packages you want"


# Python3
echo "$PATH_PREFIX/opt/python/libexec/bin:$PATH" >> ~/.zprofile
source ~/.zprofile
alias python='python3'
alias pip='pip3'
pip3 install --user pipenv
pip3 install virtualenv
pip3 install virtualenvwrapper

# Docker Desktop
[[ $ARCH == $ARCH_AMD64 ]] && DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_campaign=docs-driven-download-mac-amd64"
[[ $ARCH == $ARCH_ARM64 ]] && DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_campaign=docs-driven-download-mac-arm64"
if [[ ! -d "/Applications/Docker.app" ]]; then
	curl $DOCKER_URL --output ~/Downloads/Docker.dmg
	hdiutil mount ~/Downloads/Docker.dmg
	sudo cp -R /Volumes/Docker/Docker.app /Applications
	hdiutil unmount /Volumes/Docker
fi

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