#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
. "$HOME/.dir_colors"
PS1='[\u@\h \W]\$ '

export EDITOR=vim
export XDG_CONFIG_HOME=~/.config/

alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
alias grep='grep --color=auto'
