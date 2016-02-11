if [ ! -f ~/.zplug/zplug ]; then
  echo "ZPlug required: https://www.github.com/b4b4r07/zplug"
  return
fi



#########
# ZPlug #
#########

source ~/.zplug/zplug

zplug "b4b4r07/zplug"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "zsh-users/zsh-completions", as:plugin, of:"src"

zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "themes/cloud", from:oh-my-zsh

zplug load



###########
# Exports #
###########

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=nvim

# FZF
export PATH="$PATH:/Users/Admin/.fzf/bin"
export FZF_DEFAULT_COMMAND='ag -g ""'



###########
# Aliases #
###########

alias vim="nvim"
alias ls="ls -alG"
alias grep="grep --color=auto"
