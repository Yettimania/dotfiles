#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Apply wall color scheme to new terminals
(cat ~/.cache/wal/sequences &)

# System Maintainence
alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Navigation
alias cdh="cd ~"
alias cdb="~/bin"
alias cdc="~/Code"
alias cddoc="~/Documents"
alias cdp="~/Pictures"
alias cdd="~/Downloads"
alias cdt="~/Templates"
alias cdm="~/Music"
alias cdblot="~/Dropbox/Apps/Blot"

# Some aliases
alias e="$EDITOR"
alias p="sudo pacman"
alias SS="sudo systemctl"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias mkd="mkdir -pv"
alias mpv="mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)"
alias x="sxiv -ft *"

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'

# Internet
alias yt="youtube-dl --add-metadata -i" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"

# Functions
#Example
#vf() { fzf | xargs -r -I % $EDITOR % ;}
