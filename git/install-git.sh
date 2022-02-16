#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

! type git &>/dev/null && echo "Cannot find git executable" && return 1

if git config --list --show-origin | grep -q "user.name" ; then 
	echo "Already configured" 
	return 0
fi

vared -p 'Your gitlab account user : ' -c USER
vared -p 'Your gitlab account email: ' -c EMAIL

git config --global user.name $USER
git config --global user.email $EMAIL

echo "Successfuly completed git configuration. To see the congifuraton run 'git config --list --show-origin'"

return