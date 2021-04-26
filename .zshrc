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
alias gbr='git branch | grep -v "master" | xargs git branch -D'
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

alias chrome='google-chrome-stable &'
alias work='cd ~/projects/fuji && source venv/bin/activate'


###########
# enhancd #
###########

export ENHANCD_DISABLE_DOT=1
export ENHANCD_DOT_SHOW_FULLPATH=1


###########
# Exports #
###########

export PATH="$PATH:/usr/local/bin:`yarn global bin`"
export EDITOR=nvim
export TERM=xterm-256color

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'


###########
# ZPlugin #
###########

if [ ! -d ~/.zplugin ]; then
   curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh | zsh
fi

source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin ice as"program"
zplugin light mrowa44/emojify

zplugin ice as"program" from"gh-r"
zplugin load junegunn/fzf-bin

zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-syntax-highlighting


#######
# NVM #
#######

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


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


#############
# Automatic #
#############

[ -f ~/.localrc ] && source ~/.localrc
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
