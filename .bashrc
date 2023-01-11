#
# ~/.bashrc
#

export PATH="$PATH:HOME/bin"
export PATH=/home/lukas/.nimble/bin:$PATH
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

loadkeys de
clear

alias ls='ls --color=auto'
alias ll='ls -l'
alias alacritty='alacritty --working-directory $(pwd) &'
alias kys='shutdown now'
PS1=' \w > '

export LANG=C 

# Load Angular CLI autocompletion.
source <(ng completion script)
source /usr/share/nvm/init-nvm.sh
export JAVA_HOME='/usr/lib/jvm/java-19-jdk'
export PATH=$JAVA_HOME/bin:$PATH
