#!/bin/sh

chmod 600 ~/dotfiles/ohk/.ssh/*

cp ~/dotfiles/crypt/ssh-encrypted/* ~/dotfiles/ohk/.ssh/
cp ~/dotfiles/crypt/db-encrypted/* ~/dotfiles/ohk/.utils/db/

ansible-vault decrypt ~/dotfiles/ohk/.ssh/*
ansible-vault decrypt ~/dotfiles/ohk/.utils/db/*