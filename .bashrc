#
# ~/.bashrc
#

export PATH="$PATH:HOME/bin"
export PATH=/home/lukas/.nimble/bin:$PATH
export PATH="$PATH:/home/lukas/go/bin"
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

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Load Angular CLI autocompletion.
source <(ng completion script)
source /usr/share/nvm/init-nvm.sh
export JAVA_HOME='/usr/lib/jvm/java-19-jdk'
export PATH=$JAVA_HOME/bin:$PATH
