#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias clc='clear'

alias server='ssh brownsr@eces-shell.colorado.edu'

export PS1="\033[32m\][\w]\[\033[0m\] \n\[\033[1;36m\]\u\[\033[1;33m\]$ \[\033[0m\]"

alias pyxis='cd /home/rane/Documents/ClassesSprg16/IndependentStudy/pyxis'

alias ..='cd ..'
alias ...='cd ../..' 
alias ....='cd ../../..' 
alias .....='cd ../../../..' 

