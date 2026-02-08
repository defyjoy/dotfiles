#!/usr/bin/env bash
# Fedora setup: run per-component scripts, then remaining installs.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FEDORA_DIR="${SCRIPT_DIR}/fedora"

for name in dnf5 eza-themes lazyssh kubectx getnf ohmyzsh antigen; do
  bash "${FEDORA_DIR}/${name}.sh"
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
