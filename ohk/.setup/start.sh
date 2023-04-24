#!/bin/sh

pretty_print() {
  printf "\n%b\n" "$1"
}

#
pretty_print "Here we go..."


# Homebrew installation
if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  pretty_print "You already have Homebrew installed...good job!"
fi

brew install ansible

ansible-playbook ohk/.setup/playbook.yml

if [ ! -d "~/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d "~/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    mkdir -p ~/.oh-my-zsh/custom/themes/
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

if [ ! -d "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    mkdir -p ~/.oh-my-zsh/custom/plugins/
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git mkdir -p ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ ! -d "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    mkdir -p ~/.oh-my-zsh/custom/plugins/
    git clone https://github.com/zsh-users/zsh-autosuggestions mkdir -p ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [ ! -d "~/.tmuxifier" ]; then
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
fi


brew install romkatv/powerlevel10k/powerlevel10k

pretty_print "🔔 p10k configure"

pretty_print "Done! 🎉"
