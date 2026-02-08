#!/usr/bin/env bash
# Oh My Zsh: silent/unattended install (https://github.com/ohmyzsh/ohmyzsh)

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed at ~/.oh-my-zsh, skipping."
fi
