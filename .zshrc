###########
# Aliases #
###########

alias vim="nvim"
alias ls="exa -abghHliS"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"

alias ga='git add'
alias gb='git branch'
alias gbd='git branch -d '
alias gcm='git commit -am'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gp='git pull'
alias gpo='git pull origin'
alias gs='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'


###########
# enhancd #
###########

export ENHANCD_DISABLE_DOT=1
export ENHANCD_DOT_SHOW_FULLPATH=1


#############
# emoji-cli #
#############

export EMOJI_CLI_KEYBIND=^E


###########
# Exports #
###########

export PATH=$PATH:/usr/local/bin
export EDITOR=nvim
export TERM=xterm-256color

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'


###########
# ZPlugin #
###########

# if [ ! -d ~/.zplug ]; then
#   curl -sL zplug.sh/installer | zsh
# fi
#
# if [[ -f ~/.zplug/init.zsh ]]; then
#   source ~/.zplug/init.zsh
# fi
#
#

if [ ! -d ~/.zplugin ]; then
   curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh | zsh
fi

source '/root/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# zplug "zplug/zplug"

# zplug "mrowa44/emojify", as:command
zplugin ice as"program"
zplugin light mrowa44/emojify
# zplug "junegunn/fzf", as:command, hook-build:"./install --key-bindings --completion --update-rc &> /dev/null", rename-to:fzf, use:"bin"
zplugin ice as"program" from"gh-r"
zplugin load junegunn/fzf-bin
# zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq
# zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
# zplug "b4b4r07/enhancd", use:init.sh
zplugin light "Duelist/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions", use:"src"
zplugin light "zsh-users/zsh-history-substring-search"
zplugin light "zsh-users/zsh-syntax-highlighting"
#
# zplug load


##########
# PROMPT #
##########

setopt PROMPT_SUBST
autoload -U colors && colors

PROMPT='%{$fg[magenta]%}%c $(git_prompt_info) % %{$reset_color%}'

GIT_PROMPT_PREFIX="%{$fg[magenta]%}[%{$fg[cyan]%}"
GIT_PROMPT_SUFFIX=""
GIT_PROMPT_DIRTY="%{$fg[magenta]%}] %{$fg_bold[yellow]%}⚡"
GIT_PROMPT_CLEAN="%{$fg[magenta]%}]"

function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$GIT_PROMPT_SUFFIX"
}

function parse_git_dirty() {
  local STATUS
  STATUS=$(command git status --porcelain --untracked-files=no 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "$GIT_PROMPT_DIRTY"
  else
    echo "$GIT_PROMPT_CLEAN"
  fi
}


##############
# Tmuxinator #
##############

source ~/.bin/tmuxinator.zsh


#############
# Automatic #
#############

[ -f ~/.localrc ] && source ~/.localrc
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
