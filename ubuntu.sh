sudo apt get install git zsh fzf autoenv eza stow

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

## Install NERD Font

curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | zsh

## Install autoenv

curl -#fLo- 'https://raw.githubusercontent.com/hyperupcall/autoenv/master/scripts/install.sh' | sh


## Install Antigen
curl -L git.io/antigen > antigen.zsh