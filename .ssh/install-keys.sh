#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

# ssh config docs: https://man.openbsd.org/ssh_config.5
# check also system ssh configuration propertes in /etc/ssh/ssh_config

[[ -f ~/.ssh/config ]] && \
	echo "SSH appears to be already configured. Please move/rename/delete ~/.ssh/config to force new configuration" && \
	return
 
# create and/or set access permissions
mkdir -p ~/.ssh && chmod 700 &>/dev/null
touch ~/.ssh/config && chmod 600 ~/.ssh/config

# Generate default SSH keys ~/.ssh/id_rsa* files. Will not override if keys exists
< /dev/zero ssh-keygen -q -N "" &>/dev/null

vared -p 'Your gitlab account user : ' -c USER

cat <<-EOF > ~/.ssh/config
Host
    HostName *
    User $USER
    IdentityFile ~/.ssh/id_rsa
    AddKeysToAgent yes
EOF

eval `ssh-agent -s` &> /dev/null
ssh-add ~/.ssh/id_rsa &> /dev/null

echo "Please use 'cat ~/.ssh/id_rsa' to get your public key and add it to gitlab, aws, etc."
return 0