#!/usr/bin/env bash
set -euo pipefail

pkgs=(
  btrfs-progs
  dosfstools
  e2fsprogs
  lvm2
  nvme-cli
  ntfs-3g
  ntfsprogs
  os-prober
  snapper
  openssh-clients
  openssh-server
  zsh
)

found=()
missing=()

echo "== rpm-ostree package check =="
for p in "${pkgs[@]}"; do
  if sudo rpm-ostree install --dry-run "$p" >/dev/null 2>&1; then
    echo "PASS  $p"
    found+=("$p")
  else
    echo "FAIL  $p"
    missing+=("$p")
  fi
done

echo
if ((${#found[@]})); then
  echo "Installing (layering) found packages:"
  printf '  - %s\n' "${found[@]}"
  sudo rpm-ostree install "${found[@]}"
  echo
  echo "DONE. Reboot to apply:"
  echo "  systemctl reboot"
else
  echo "No packages available to install via rpm-ostree (based on your enabled repos)."
fi

if ((${#missing[@]})); then
  echo
  echo "Missing from your current rpm-ostree repos:"
  printf '  - %s\n' "${missing[@]}"
  exit 1
fi



pkgs=(
  ansible
  argocd
  autoenv
  autojump
  awscli
  bun
  cursor
  cursor-cli
  eza
  fzf
  gh
  go-task
  helm
  htop
  k9s
  kubecolor
  kubectx
  kubernetes-cli
  micro
  nvm
  telnet
  tfenv
  tgenv
  tofuenv
  tree
  uv
  watch
  xz
  zstd
)

found=()
missing=()

echo "== brew package check =="
command -v brew >/dev/null 2>&1 || { echo "brew not found in PATH"; exit 2; }

brew update >/dev/null

for p in "${pkgs[@]}"; do
  if brew info "$p" >/dev/null 2>&1; then
    echo "PASS  $p"
    found+=("$p")
  else
    echo "FAIL  $p"
    missing+=("$p")
  fi
done

echo
if ((${#found[@]})); then
  echo "Installing found formulae:"
  printf '  - %s\n' "${found[@]}"
  brew install "${found[@]}"
else
  echo "No formulae available to install."
fi

if ((${#missing[@]})); then
  echo
  echo "Missing formulae (not in your taps / not supported on Linux):"
  printf '  - %s\n' "${missing[@]}"
  exit 1
fi
