#!/usr/bin/env bash
# macOS setup: Homebrew formulae and casks.
# Generated from current `brew list --formula` and `brew list --cask`.

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Formulae
brew install \
  ansible \
  argocd \
  autoenv \
  autojump \
  awscli \
  bun \
  certifi \
  cffi \
  container \
  eza \
  fzf \
  gh \
  go-task \
  grep \
  helm \
  htop \
  k9s \
  kubecolor \
  kubectx \
  kubernetes-cli \
  micro \
  ncurses \
  nvm \
  readline \
  sqlite \
  telnet \
  tfenv \
  tgenv \
  tofuenv \
  tree \
  uv \
  watch \
  xz \
  zstd

# Casks
brew install --cask \
  arc \
  calibre \
  cursor \
  cursor-cli \
  gcloud-cli \
  ghostty \
  iterm2 \
  lens \
  linear-linear \
  notion \
  orbstack \
  slack \
  swish \
  twingate \
  zen

# Optional: run common installers (distro-agnostic) if present
for name in eza-themes lazyssh kubectx getnf ohmyzsh antigen cursor eza lazygit autoenv nerd-fonts; do
  if [[ -f "${SCRIPT_DIR}/common/${name}.sh" ]]; then
    bash "${SCRIPT_DIR}/common/${name}.sh"
  fi
done
