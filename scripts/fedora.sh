#!/usr/bin/env bash
# Fedora setup: base packages (dnf5), then common installers (distro-agnostic), then remaining.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Base system packages (Fedora dnf5)
sudo dnf5 install -y \
  ansible \
  autojump \
  awscli2 \
  btrfs-progs \
  cargo \
  dosfstools \
  e2fsprogs \
  fastfetch \
  fzf \
  jq \
  git \
  glibc \
  golang \
  helm \
  htop \
  k9s \
  lvm2 \
  micro \
  ntfs-3g \
  ntfsprogs \
  nvme-cli \
  openssh \
  os-prober \
  qbittorrent \
  rust \
  snapper \
  stow \
  zsh

# Common installers (distro-agnostic: any Linux)
for name in eza-themes lazyssh kubectx getnf ohmyzsh antigen cursor; do
  bash "${SCRIPT_DIR}/common/${name}.sh"
done

# eza — modern ls replacement (via cargo; installs to ~/.cargo/bin)
cargo install eza

# lazygit (via go; install to ~/go/bin)
go install github.com/jesseduffield/lazygit@latest

# autoenv — directory-based environments (https://github.com/hyperupcall/autoenv)
[ -d "${HOME}/.autoenv" ] || curl -#fLo- 'https://raw.githubusercontent.com/hyperupcall/autoenv/main/scripts/install.sh' | sh

# Nerd Fonts (requires getnf from getnf.sh)
getnf -i ComicShannsMono
fc-cache -f -v

sudo chsh -s $(which zsh) $(whoami)
