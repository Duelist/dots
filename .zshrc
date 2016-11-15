#########
# ZPlug #
#########

if [ ! -d $ZPLUG_HOME ]; then
  curl -sL zplug.sh/installer | zsh
fi

if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
fi

zplug "zplug/zplug"

zplug "mrowa44/emojify", as:command
zplug "junegunn/fzf", as:command, rename-to:fzf
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions", use:"src"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"

zplug load --verbose


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

export EDITOR=nvim
export TERM=xterm-256color

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'


###########
# Aliases #
###########

alias vim="nvim"
alias ls="ls -alG"
alias grep="grep --color=auto"


##########
# Base16 #
##########

# BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


##############
# Tmuxinator #
##############

source ~/.bin/tmuxinator.zsh


#############
# Automatic #
#############
#
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
