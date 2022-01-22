#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}

# either automatically install plugins and fonts or just use the templated .hyper.js

# hyper plugins
# hyper i hyper-one-dark
# hyper i hyper-font-ligatures
# hyper i hyper-active-tab

# hyper fonts
# sed...fontFamily: '"FiraCode Nerd Font", Consolas, "Lucida Console", monospace',

[[ -f ~/.hyper.js ]] && mv ~/.hyper.js ~/.hyper.js.bak
[[ -L ~/.hyper.js ]] && rm -f ~/.hyper.js
ln -s "$SCRIPT_DIR/.hyper.js" ~/.hyper.js