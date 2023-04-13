#!/bin/sh

mkdir -p ~/dotfiles/ohk/.ssh
mkdir -p ~/dotfiles/ohk/.utils/db

chmod 600 ~/dotfiles/ohk/.ssh/*

cp ~/dotfiles/crypt/ssh-encrypted/* ~/dotfiles/ohk/.ssh/
cp ~/dotfiles/crypt/db-encrypted/* ~/dotfiles/ohk/.utils/db/

ansible-vault decrypt ~/dotfiles/ohk/.ssh/*
ansible-vault decrypt ~/dotfiles/ohk/.utils/db/*