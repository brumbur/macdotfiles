#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# either automatically install plugins and fonts or just use the templated .hyper.js

# hyper plugins
# hyper i hyper-one-dark
# hyper i hyper-font-ligatures
# hyper i hyper-active-tab

# hyper fonts
# sed...fontFamily: '"FiraCode Nerd Font", Consolas, "Lucida Console", monospace',

[[ -f ~/.hyper.js ]] && mv ~/.hyper.js ~/.hyper.js.bak
ln -s "$SCRIPT_DIR/.hyper.js" ~/.hyper.js