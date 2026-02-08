#!/usr/bin/env bash
# eza-themes: clone to ~/Documents/repos, link theme (https://github.com/eza-community/eza-themes)

mkdir -p "${HOME}/Documents/repos" "${HOME}/.config/eza"
[ -d "${HOME}/Documents/repos/eza-themes" ] || git clone https://github.com/eza-community/eza-themes.git "${HOME}/Documents/repos/eza-themes"
ln -sf "${HOME}/Documents/repos/eza-themes/themes/gruvbox-dark.yml" "${HOME}/.config/eza/theme.yml"
