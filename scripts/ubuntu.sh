#!/usr/bin/env bash
# Ubuntu setup: base packages (apt), then common installers (distro-agnostic), then remaining.
# Mirrors fedora.sh package set with Ubuntu-appropriate install methods.

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"

# Ensure universe is enabled for micro, qbittorrent, fastfetch (on some releases)
sudo add-apt-repository -y universe 2>/dev/null || true
sudo apt-get update -y

# Base system packages (Ubuntu apt)
# Note: glibc is provided by libc6 (always installed). ntfsprogs functionality is in ntfs-3g on Ubuntu.
# fastfetch is in Ubuntu 24.10+ and universe; on older releases install from GitHub releases or PPA if desired.
sudo apt-get install -y \
  ansible \
  autojump \
  awscli \
  btrfs-progs \
  cargo \
  dosfstools \
  e2fsprogs \
  fzf \
  jq \
  git \
  golang-go \
  htop \
  lvm2 \
  micro \
  ntfs-3g \
  nvme-cli \
  openssh-client \
  openssh-server \
  os-prober \
  qbittorrent \
  snapper \
  stow \
  unzip \
  zsh
sudo apt-get install -y fastfetch 2>/dev/null || true

# Common installers (distro-agnostic: non-apt packages + shared setup)
for name in helm k9s kubectl eza-themes lazyssh kubectx getnf ohmyzsh antigen cursor eza lazygit autoenv nerd-fonts; do
  bash "${SCRIPT_DIR}/common/${name}.sh"
done

sudo chsh -s "$(which zsh)" "$(whoami)"
