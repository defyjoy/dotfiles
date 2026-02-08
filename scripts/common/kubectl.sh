#!/usr/bin/env bash
# kubectl: Kubernetes CLI (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
# Common: distro-agnostic (official binary)

KUBE_ARCH=$(uname -m); [ "$KUBE_ARCH" = aarch64 ] && KUBE_ARCH=arm64
KUBE_VER=$(curl -sL https://dl.k8s.io/release/stable.txt)
curl -sSL "https://dl.k8s.io/release/${KUBE_VER}/bin/linux/${KUBE_ARCH}/kubectl" -o /tmp/kubectl
chmod +x /tmp/kubectl
sudo mv /tmp/kubectl /usr/local/bin/kubectl
