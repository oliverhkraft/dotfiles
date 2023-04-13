#!/bin/sh

[[ -f ~/dotfiles/ohk/.ssh/config ]] || touch ~/dotfiles/ohk/.ssh/config
[[ -f ~/dotfiles/ohk/.ssh/id_rsa ]] || touch ~/dotfiles/ohk/.ssh/id_rsa
[[ -f ~/dotfiles/ohk/.ssh/known_hosts ]] || touch ~/dotfiles/ohk/.ssh/known_hosts
[[ -f ~/dotfiles/ohk/.ssh/id_rsa.pub ]] || touch ~/dotfiles/ohk/.ssh/id_rsa.pub
cp ~/dotfiles/ohk/.ssh/* ~/dotfiles/crypt/ssh-encrypted/

[[ -f ~/dotfiles/ohk/.utils/db/clone-db.sh ]] || touch ~/dotfiles/ohk/.utils/db/clone-db.sh
cp ~/dotfiles/ohk/.utils/db/* ~/dotfiles/crypt/db-encrypted/

chmod 600 ~/dotfiles/crypt/ssh-encrypted/*

ansible-vault encrypt ~/dotfiles/crypt/ssh-encrypted/*
ansible-vault encrypt ~/dotfiles/crypt/db-encrypted/*