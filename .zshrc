#########
# ZPlug #
#########

if [ ! -f ~/.zplug/zplug ]; then
  echo "ZPlug required: https://www.github.com/b4b4r07/zplug"
  return
fi

source ~/.zplug/zplug

zplug "b4b4r07/zplug"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "zsh-users/zsh-completions", as:plugin, of:"src"

zplug "lib/git", from:oh-my-zsh

zplug load



##########
# PROMPT #
##########

PROMPT='%{$fg[magenta]%}%c $(git_prompt_info) % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}] %{$fg_bold[yellow]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%}]"



###########
# Exports #
###########

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=nvim

# FZF
export PATH="$PATH:~/.fzf/bin"
export FZF_DEFAULT_COMMAND='ag -g ""'



###########
# Aliases #
###########

alias vim="nvim"
alias ls="ls -alG"
alias grep="grep --color=auto"
