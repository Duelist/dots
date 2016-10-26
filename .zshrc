#########
# ZPlug #
#########

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

if [ ! -d $ZPLUG_HOME ]; then
  echo "ZPlug required: https://www.github.com/b4b4r07/zplug"
  return
fi

zplug "zplug/zplug"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "zsh-users/zsh-completions", as:plugin, use:"src"

zplug load


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


###########
# Exports #
###########

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=nvim
export TERM=xterm-256color

# FZF
export PATH="$PATH:~/.fzf/bin"
export FZF_DEFAULT_COMMAND='ag -g ""'


###########
# Aliases #
###########

alias vim="nvim"
alias ls="ls -alG"
alias grep="grep --color=auto"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


##########
# Base16 #
##########

# BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


##############
# Tmuxinator #
##############

source ~/.bin/tmuxinator.zsh


##########
# Travis #
##########

[ -f /Users/Admin/.travis/travis.sh ] && source /Users/Admin/.travis/travis.sh
