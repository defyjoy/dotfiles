#!/usr/bin/env bash
# macOS setup: Homebrew formulae and casks.
# Generated from current `brew list --formula` and `brew list --cask`.

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Ensure brew is in PATH for this script (install script doesn't update current shell)
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Formulae
brew install \
  cursor \
  cursor-cli \
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
  adobe-acrobat-reader \
  zstd \
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
  zen \
  rectangle-pro \
  forklift \
  discord \
  google-chrome \
  firefox \
  brave-browser \
  spotify \
  steam \
  epic-games \
  origin \
  ubisoft-connect \
  applite \
  monitorcontrol \
  bartender \
  raycast \
  alt-tab \
  meetingbar \
  shottr \
  menubarx \
  yt-music \
  macs-fan-control


# Optional: run common installers (distro-agnostic) if present
for name in eza-themes lazyssh kubectx getnf ohmyzsh antigen cursor eza lazygit autoenv nerd-fonts; do
  if [[ -f "${SCRIPT_DIR}/common/${name}.sh" ]]; then
    bash "${SCRIPT_DIR}/common/${name}.sh"
  fi
done
