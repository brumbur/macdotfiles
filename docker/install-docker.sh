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

# Docker Desktop  (macos only)
DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg"
[[ $ARCH == $ARCH_AMD64 ]] && DOCKER_URL="$DOCKER_URL?utm_campaign=docs-driven-download-mac-amd64"
[[ $ARCH == $ARCH_ARM64 ]] && DOCKER_URL="$DOCKER_URL?utm_campaign=docs-driven-download-mac-arm64"
if [[ ! $ARCH == $ARCH_Win64 && ! -d "/Applications/Docker.app" ]]; then
	curl $DOCKER_URL --output ~/Downloads/Docker.dmg
	hdiutil mount ~/Downloads/Docker.dmg
	sudo cp -R /Volumes/Docker/Docker.app /Applications
	hdiutil unmount /Volumes/Docker
fi