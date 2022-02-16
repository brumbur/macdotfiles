#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

ARCH_AMD64="i386"
ARCH_ARM64="arm"
ARCH_Win64="x86_64"

ARCH=$(uname -p)

[[ $ARCH == $ARCH_AMD64 ]] && PATH_PREFIX="/usr/local"
[[ $ARCH == $ARCH_ARM64 ]] && PATH_PREFIX="/opt/homebrew"
[[ $ARCH == $ARCH_Win64 ]] && PATH_PREFIX="/home/linuxbrew/.linuxbrew/Homebrew"

# Python3
pip3 install --user pipenv &>/dev/null
pip3 install virtualenv &>/dev/null
pip3 install virtualenvwrapper &>/dev/null
python3 -m pip install --upgrade pip &>/dev/null

echo "Configuration for Python completed"