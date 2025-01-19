
# DOTFILES 


## CLONE REPO

```bash
git clone git@github.com:defyjoy/dotfiles.git
```

## INSTALL STOW

```bash
cd dotfiles
sudo zypper in stow
stow .
```

## INSTALL PACKAGES

```bash
cat installed-packagess.txt | xargs sudo zypper install
```


## CREATE SYMLINKS IN HOME DIRECTORY 

```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

## SAVE INSTALLED PACKAGES INTO `installed-packages.txt`

```bash
zypper search --installed-only | \grep --color i+ | awk '{print $3}' > installed-packages.txt
```
