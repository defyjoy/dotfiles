#!/usr/bin/env bash
# Base system packages via dnf5 (Fedora).

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
