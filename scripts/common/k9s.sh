#!/usr/bin/env bash
# k9s: Kubernetes CLI TUI (https://github.com/derailed/k9s)
# Common: distro-agnostic (GitHub release binary)

K9S_TAG=$(curl -fsSL https://api.github.com/repos/derailed/k9s/releases/latest | jq -r .tag_name)
K9S_ARCH=$(uname -m); [ "$K9S_ARCH" = aarch64 ] && K9S_ARCH=arm64
K9S_NAME="k9s_Linux_${K9S_ARCH}.tar.gz"
curl -fsSL "https://github.com/derailed/k9s/releases/download/${K9S_TAG}/${K9S_NAME}" -o /tmp/k9s.tar.gz
tar -xzf /tmp/k9s.tar.gz -C /tmp
sudo mv /tmp/k9s /usr/local/bin/
rm -f /tmp/k9s.tar.gz
