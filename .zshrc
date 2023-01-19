###########
# Aliases #
###########

alias vim="nvim"
alias ls="exa -abghHliS"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias dots="cd ~/dots/"

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

alias chrome='google-chrome-stable'
alias work='cd ~/projects/fuji && source venv/bin/activate && fnm use 19'


############
# Keybinds #
############

bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char


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

#############
# TailScale #
#############

function ts() {
    if [[ $# -eq 1 && $1 = 'up' ]]; then
        echo 'sudo tailscale up --accept-dns --accept-routes'
        return 0
    fi

    echo "sudo tailscale $@"
}
autoload -Uz ts


#########
# ZInit #
#########

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice as"program"
zinit light mrowa44/emojify

zinit ice as"program" from"gh-r"
zinit load junegunn/fzf-bin

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting


########
# NVIM #
########

function nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim $@
    deactivate
  else
    command nvim $@
  fi
}

alias nvim=nvimvenv


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
eval "$(fnm env --use-on-cd)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/go/bin:$PATH"
