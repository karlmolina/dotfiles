source ~/zsh-defer/zsh-defer.plugin.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/flutter/bin"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Autocompletions and sources nvm
zinit ice wait'2' lucid
zi snippet OMZP::nvm
# zinit ice wait lucid
# zi snippet OMZP::git
# auto-completion for docker
zinit ice wait lucid
zi snippet OMZP::docker
zinit ice wait lucid
zi snippet OMZP::fzf
zinit ice wait lucid
zi snippet OMZP::z
zinit ice wait lucid
zi snippet OMZP::golang
# Autocomplete for sdkman
zi snippet OMZP::sdk
# Load pyenv if it's found
zinit ice wait lucid
zi snippet OMZP::pyenv
# completion support for awscli
zinit ice wait lucid
zi snippet OMZP::aws

zi snippet OMZP::vi-mode
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_CURSOR_INSERT=5

zicompinit
zicdreplay
zi load Aloxaf/fzf-tab
zi load zsh-users/zsh-autosuggestions

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
# pasteinit() {
#   OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
#   zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
# }
# 
# pastefinish() {
#   zle -N self-insert $OLD_SELF_INSERT
# }
# zstyle :bracketed-paste-magic paste-init pasteinit
# zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Fzf options
# So we can see files beginning with '.'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Bat theme
export BAT_THEME="Coldark-Cold"

# Set editor as vim
export EDITOR='vim'


# Source alias files which source other alias files
source ~/.zsh_aliases
source ~/.bash_aliases
source ~/.extra.sh

# Source other function files
source ~/.fzfgitfunctions.zsh

# Less won't be used if it fits in the page
export LESS="-F -X $LESS"

# zmodload zsh/complist
# zstyle ':completion:*' menu select

# use the vi navigation keys in menu completion
# bindkey -M menuselect '^h' vi-backward-char
# bindkey -M menuselect '^k' vi-up-line-or-history
# bindkey -M menuselect '^l' vi-forward-char
# bindkey -M menuselect '^j' vi-down-line-or-history

# bindkey -M menuselect '?' history-incremental-search-forward

# Easier bindings than going to cmd mode then pressing j or k
bindkey -M main '^k' up-history
bindkey -M main '^j' down-history
bindkey -M main '^l' end-of-line
bindkey -M vicmd '^k' up-history
bindkey -M vicmd '^j' down-history
bindkey -M vicmd '^l' end-of-line

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# stop globing with ? and *
unsetopt nomatch

# show hidden dotfiles when using tab completion
setopt globdots

# set golang path
export GOPATH=$(go env GOPATH)
# add golang bin path to PATH
export PATH=$PATH:$(go env GOPATH)/bin

zsh-defer eval "$(pyenv init -)"

zsh-defer source /usr/local/opt/chruby/share/chruby/chruby.sh
zsh-defer source /usr/local/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.2
zsh-defer source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
