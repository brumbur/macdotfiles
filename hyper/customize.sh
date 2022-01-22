#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# either automatically install plugins and fonts or just use templated .hyper.js

# hyper plugins
# hyper i hyper-one-dark
# hyper i hyper-font-ligatures
# hyper i hyper-active-tab

# hyper fonts
# sed...fontFamily: '"FuraCode Nerd Font", "FuraCode Nerd Font Mono", "FuraCode NF", "Fira Code", "Hack Nerd Font", Menlo, "DejaVu Sans Mono",  Consolas, "Lucida Console", monospace',

mv ~/.hyper.js ~/.hyper.js.bak && ln -s "$SCRIPT_DIR/.hyper.js" ~/.hyper.js