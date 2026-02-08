# DNF package availability report

Checked all packages from `installed-packages.txt` against the DNF repository (Fedora).  
**Date:** 2025-02-08

---

## Packages **not** in the DNF repository

These names have **no matching package** in default Fedora DNF repos (exact name search):

| Package | Note |
|---------|------|
| **argocd-cli** | Install from upstream or add Argo CD repo |
| **argocd-cli-zsh-completion** | Same as above |
| **argocd-diff-preview** | Same as above |
| **aws-cli** | Use **awscli2** on Fedora (`dnf install awscli2`) |
| **btrfsprogs** | Use **btrfs-progs** on Fedora (`dnf install btrfs-progs`) |
| **code** | VS Code; add Microsoft repo or install from upstream |
| **container_runtime** | SUSE pattern; on Fedora use **podman** (e.g. `dnf install podman`) |
| **fnm** | Node version manager; install via script or third-party repo |
| **go** | Use **golang** on Fedora (`dnf install golang`) |
| **grub2-x86_64-efi** | Use **grub2-efi-x64** on Fedora (`dnf install grub2-efi-x64`) |
| **helmfile-zsh-completion** | Not in default repos; check COPR or install manually |
| **helmtui** | Not in default repos; check COPR or install manually |
| **kernel-default** | SUSE name; on Fedora use **kernel** or **kernel-core** |
| **neofetch** | Removed from Fedora repos; use **fastfetch** (`dnf install fastfetch`) or install from COPR |
| **shim** | Use **shim-x64** on Fedora for x86_64 UEFI (`dnf install shim-x64`) |
| **transactional-update** | SUSE MicroOS specific; no Fedora equivalent |

---

## Packages that **exist** in DNF (exact or obvious match)

- ansible  
- autojump  
- dosfstools  
- e2fsprogs  
- eza  
- fastfetch  
- fzf  
- git  
- glibc  
- helm  
- htop  
- irqbalance  
- k9s  
- kexec-tools  
- kvantum  V
- lvm2  
- micro  
- ntfs-3g  
- ntfsprogs  V
- nvme-cli  
- openssh  
- os-prober  
- qbittorrent  
- rust  
- snapper  
- stow  
- zsh  

---

## Summary

- **Not in DNF (exact name):** 16 entries  
- **Fedora equivalent exists (different name):** 7 of those (aws-cli→awscli2, btrfsprogs→btrfs-progs, go→golang, grub2-x86_64-efi→grub2-efi-x64, shim→shim-x64, kernel-default→kernel, container_runtime→podman).  
- **Truly unavailable in default repos:** argocd-* (3), code, fnm, helmfile-zsh-completion, helmtui, neofetch, transactional-update.
