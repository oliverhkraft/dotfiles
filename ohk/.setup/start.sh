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

pretty_print "Done! 🎉"