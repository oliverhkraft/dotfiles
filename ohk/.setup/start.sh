#!/bin/sh

pretty_print() {
  printf "\n%b\n" "$1"
}

#
pretty_print "Here we go..."


# Homebrew installation
if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

brew install ansible

ansible-playbook ohk/.setup/playbook.yml

pretty_print "Done! 🎉"