if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
ZSH_THEME="powerlevel10k/powerlevel10k"


source $ZSH/oh-my-zsh.sh

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH=/Users/Shared/DBngin/mysql/8.0.27/bin:$PATH

alias cl="clear"
alias conf="nvim $HOME/.zshrc"
alias conf-nvim="nvim $HOME/.config/nvim/init.lua"
alias reload="source $HOME/.zshrc"

# Git
alias gi="git init"
alias gs="git status"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg="git log --graph --oneline --decorate --all"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# Dev tools
alias vi="nvim"
alias vim="nvim"
alias sshcopy="pbcopy < ~/.ssh/id_rsa.pub"

## ---------------- HISTORY ---------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ


## ---------------- OPTIONS ---------------------------------------------------
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
setopt auto_cd
setopt correct_all
setopt auto_list
setopt auto_menu
setopt always_to_end

## --------------- FUNCTIONS --------------------------------------------------
# Remove node modules and install and run prod script
alias npm-rebuild="rm -rf node_modules && npm install && npm run production"

# Remove vendor and install updated
alias composer-rebuild="rm -rf vendor && composer install"

alias cleanseed="php artisan migrate:fresh && php artisan db:seed"

alias checker-all="./vendor/bin/pint && ./vendor/bin/phpstan analyze --memory-limit=2G && ./bin/test tests"
alias checker="./vendor/bin/pint && ./vendor/bin/phpstan analyze --memory-limit=2G"

alias phpstan-baseline="./vendor/bin/phpstan analyse --generate-baseline --memory-limit=2G"

alias clone-db='sh ~/.utils/db/clone-db.sh'
