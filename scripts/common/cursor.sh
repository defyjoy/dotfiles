#!/usr/bin/env bash
# Cursor CLI + IDE (https://cursor.com)
# Common: distro-agnostic (Linux)

set -e

# --- Cursor CLI ---
curl https://cursor.com/install -fsS | bash

# --- Cursor IDE ---
CURSOR_VERSION="${CURSOR_VERSION:-2.4}"
ARCH=$(uname -m)
case "$ARCH" in
  aarch64|arm64) CURSOR_ARCH=arm64 ;;
  x86_64)        CURSOR_ARCH=x64 ;;
  *)             echo "Unsupported arch: $ARCH" >&2; exit 1 ;;
esac

if command -v dnf &>/dev/null || command -v dnf5 &>/dev/null || command -v yum &>/dev/null; then
  PKG=rpm
elif command -v apt-get &>/dev/null || command -v apt &>/dev/null; then
  PKG=deb
else
  echo "Unsupported package manager (need dnf/yum or apt)" >&2
  exit 1
fi

CURSOR_URL="https://api2.cursor.sh/updates/download/golden/linux-${CURSOR_ARCH}-${PKG}/cursor/${CURSOR_VERSION}"
CURSOR_FILE="/tmp/cursor.${PKG}"

echo "Downloading Cursor IDE (${CURSOR_ARCH}, ${PKG})..."
curl -fsSL "$CURSOR_URL" -o "$CURSOR_FILE"

case "$PKG" in
  rpm) sudo rpm -Uvh --replacepkgs "$CURSOR_FILE" ;;
  deb) sudo dpkg -i "$CURSOR_FILE" || sudo apt-get install -f -y ;;
esac
rm -f "$CURSOR_FILE"
echo "Cursor IDE installed."
