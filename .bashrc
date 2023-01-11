#
# ~/.bashrc
#

export PATH="$PATH:HOME/bin"
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias alacritty='alacritty --working-directory $(pwd) &'
alias kys='shutdown now'

PS1=' \w > '
source /usr/share/nvm/init-nvm.sh

export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export JAVA_HOME='/usr/lib/jvm/java-19-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'
