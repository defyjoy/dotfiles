#!/usr/bin/env bash
# DNF install commands from installed-packages.txt + getnf, oh-my-zsh; eza via cargo

sudo dnf install -y \
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

# eza — modern ls replacement (via cargo; installs to ~/.cargo/bin)
cargo install eza

# lazygit (via go; install to ~/go/bin)
go install github.com/jesseduffield/lazygit@latest

# lazyssh — Option 2: download binary from releases (https://github.com/Adembc/lazyssh)
# Asset names: lazyssh_Linux_x86_64.tar.gz, lazyssh_Linux_arm64.tar.gz (no amd64)
LAZYSSH_TAG=$(curl -fsSL https://api.github.com/repos/Adembc/lazyssh/releases/latest | jq -r .tag_name)
LAZYSSH_ARCH=$(uname -m); [ "$LAZYSSH_ARCH" = aarch64 ] && LAZYSSH_ARCH=arm64
LAZYSSH_URL="https://github.com/Adembc/lazyssh/releases/download/${LAZYSSH_TAG}/lazyssh_Linux_${LAZYSSH_ARCH}.tar.gz"
if curl -fsSL "$LAZYSSH_URL" -o /tmp/lazyssh.tar.gz; then
  tar -xzf /tmp/lazyssh.tar.gz -C /tmp
  if [ -f /tmp/lazyssh ]; then
    sudo mv /tmp/lazyssh /usr/local/bin/
  else
    for d in /tmp/lazyssh_*; do [ -d "$d" ] && sudo mv "$d"/lazyssh /usr/local/bin/ && rm -rf "$d"; break; done
  fi
  rm -f /tmp/lazyssh.tar.gz
else
  echo "lazyssh: failed to download from $LAZYSSH_URL" >&2
fi

# kubectx + kubens — switch kubectl context/namespace (https://github.com/ahmetb/kubectx); install from GitHub release binaries
KUBECTX_TAG=$(curl -fsSL https://api.github.com/repos/ahmetb/kubectx/releases/latest | jq -r .tag_name)
KUBECTX_ARCH=$(uname -m); [ "$KUBECTX_ARCH" = aarch64 ] && KUBECTX_ARCH=arm64
curl -fsSL "https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_TAG}/kubectx_${KUBECTX_TAG}_linux_${KUBECTX_ARCH}.tar.gz" -o /tmp/kubectx.tar.gz
tar -xzf /tmp/kubectx.tar.gz -C /tmp
sudo mv /tmp/kubectx /usr/local/bin/ 2>/dev/null || true
sudo mv /tmp/kubens /usr/local/bin/ 2>/dev/null || true
# If tarball had subdir (e.g. kubectx_v0.9.5_linux_x86_64/), move from there
for d in /tmp/kubectx_*_linux_*; do [ -d "$d" ] && sudo mv "$d"/kubectx "$d"/kubens /usr/local/bin/ 2>/dev/null; rm -rf "$d"; done
rm -f /tmp/kubectx.tar.gz

# getnf — Nerd Font installer (https://github.com/getnf/getnf); installs to ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash -s -- --silent

# autoenv — directory-based environments (https://github.com/hyperupcall/autoenv)
[ -d "${HOME}/.autoenv" ] || curl -#fLo- 'https://raw.githubusercontent.com/hyperupcall/autoenv/main/scripts/install.sh' | sh

# oh-my-zsh — silent/unattended install only if not already installed
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed at ~/.oh-my-zsh, skipping."
fi
