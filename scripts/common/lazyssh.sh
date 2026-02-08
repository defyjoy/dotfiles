#!/usr/bin/env bash
# lazyssh: download binary from releases (https://github.com/Adembc/lazyssh)
# Common: distro-agnostic

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
  exit 1
fi
