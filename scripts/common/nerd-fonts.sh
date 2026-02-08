#!/usr/bin/env bash
# nerd-fonts: install default Nerd Font via getnf and refresh font cache
# Common: distro-agnostic (requires getnf to be installed first)

export PATH="$HOME/.local/bin:$PATH"
getnf -i ComicShannsMono
fc-cache -f -v
