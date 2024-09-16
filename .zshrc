# Uncomment to use the profiling module
# zmodload zsh/zprof
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

zi load Aloxaf/fzf-tab
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

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

function awscreds() {
    export AWS_PAGER=""
    aws sts get-caller-identity --profile $1 || aws sso login --profile $1
    FILE=~/.aws/cli/cache/$(ls -t ~/.aws/cli/cache | head -n 1)

    export AWS_ACCESS_KEY_ID="$(jq -r '.Credentials.AccessKeyId' $FILE)" AWS_SECRET_ACCESS_KEY="$(jq -r '.Credentials.SecretAccessKey' $FILE)" AWS_SESSION_TOKEN="$(jq -r '.Credentials.SessionToken' $FILE)"
}

# Fzf options
# So we can see files beginning with '.'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Bat theme
export BAT_THEME="Coldark-Cold"

# Set editor as vim
if [ -n "$NVIM" ]; then
    # alias nvim="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    # export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    # export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

alias vi="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"

# Source alias files which source other alias files
source ~/.zsh_aliases
source ~/.bash_aliases
source ~/.extra.sh

# Source other function files
source ~/.fzfgitfunctions.zsh

# Less won't be used if it fits in the page
export LESS="-F -X $LESS"

zmodload zsh/complist
zstyle ':completion:*' menu select

# use the vi navigation keys in menu completion
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

bindkey -M menuselect '?' history-incremental-search-forward

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

# dont share history between terminals, add to history right when command is run
setopt inc_append_history

# all the history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# Load history from other shells
alias gethistory='fc -RI'

zsh-defer eval "$(pyenv init -)"

zsh-defer source /usr/local/opt/chruby/share/chruby/chruby.sh
zsh-defer source /usr/local/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.2
zsh-defer source "$HOME/.sdkman/bin/sdkman-init.sh"


[ -f "/Users/karl/.ghcup/env" ] && source "/Users/karl/.ghcup/env" # ghcup-env
# pnpm
export PNPM_HOME="/Users/karl/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(/usr/local/bin/brew shellenv)"
export PATH=/opt/homebrew/bin:$PATH

# bun completions
[ -s "/Users/karl/.bun/_bun" ] && source "/Users/karl/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
zsh-defer eval "$(phpenv init -)"

# Add adb to path
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
# Add emulator to path
export PATH="$PATH:$HOME/Library/Android/sdk/emulator"

export PATH="$PATH:/usr/local/go/bin"

export XDG_CONFIG_HOME="$HOME/.config"

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###
fpath=(/opt/homebrew/opt/go-task/share/zsh/site-functions $fpath)
autoload -U compinit && compinit

# sst
export PATH=/Users/karl/.sst/bin:$PATH


# keep this at end
eval "$(starship init zsh)"
