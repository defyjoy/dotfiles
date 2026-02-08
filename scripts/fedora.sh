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

# Common installers (distro-agnostic: non-dnf packages + shared setup)
# helm, k9s installed via dnf above; kubectl, eza, lazygit, autoenv, nerd-fonts via common scripts
for name in kubectl eza-themes lazyssh kubectx getnf ohmyzsh antigen cursor eza lazygit autoenv nerd-fonts; do
  bash "${SCRIPT_DIR}/common/${name}.sh"
done

sudo chsh -s $(which zsh) $(whoami)
