pkgs=(
  ansible autojump awscli2 btrfs-progs cargo dosfstools e2fsprogs fastfetch fzf jq git glibc
  golang helm htop k9s lvm2 micro ntfs-3g ntfsprogs nvme-cli openssh os-prober qbittorrent
  rust snapper stow zsh
)

missing=()
for p in "${pkgs[@]}"; do
  if sudo rpm-ostree install --dry-run "$p" >/dev/null 2>&1; then
    echo "FOUND   $p"
  else
    echo "MISSING $p"
    missing+=("$p")
  fi
done

echo
if ((${#missing[@]})); then
  echo "Missing packages:"
  printf ' - %s\n' "${missing[@]}"
  exit 1
else
  echo "All packages are available in your current rpm-ostree repos."
fi
