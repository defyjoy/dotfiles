#!/usr/bin/env bash
# kubectx + kubens: switch kubectl context/namespace (https://github.com/ahmetb/kubectx)
# Common: distro-agnostic

KUBECTX_TAG=$(curl -fsSL https://api.github.com/repos/ahmetb/kubectx/releases/latest | jq -r .tag_name)
KUBECTX_ARCH=$(uname -m); [ "$KUBECTX_ARCH" = aarch64 ] && KUBECTX_ARCH=arm64
curl -fsSL "https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_TAG}/kubectx_${KUBECTX_TAG}_linux_${KUBECTX_ARCH}.tar.gz" -o /tmp/kubectx.tar.gz
tar -xzf /tmp/kubectx.tar.gz -C /tmp
sudo mv /tmp/kubectx /usr/local/bin/ 2>/dev/null || true
sudo mv /tmp/kubens /usr/local/bin/ 2>/dev/null || true
for d in /tmp/kubectx_*_linux_*; do [ -d "$d" ] && sudo mv "$d"/kubectx "$d"/kubens /usr/local/bin/ 2>/dev/null; rm -rf "$d"; done
rm -f /tmp/kubectx.tar.gz
