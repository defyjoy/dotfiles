
# DOTFILEs 

These dotfiles are for `opensuse-microos` setup.


## CLONE REPO

```bash
git clone git@github.com:defyjoy/dotfiles.git
```

## INSTALL STOW AND LINK DOTFILES

Stow only links **package directories** (e.g. `zsh/`, `.config/`), not loose files. Run from the repo with target = home:

```bash
cd dotfiles
sudo zypper in stow   # or: sudo dnf install stow
stow -t "$HOME" .
```

This creates `~/.zshrc` (from `zsh/`) and `~/.config/...` (from `.config/`). No manual `ln -s` needed.

## INSTALL PACKAGES

```bash
cat installed-packagess.txt | xargs sudo zypper install
```
