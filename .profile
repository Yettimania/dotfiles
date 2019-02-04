#!/bin/bash
#PATH export includes all subdirectories as well
export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | tr '\n' ':')"
export PYTHONPATH="{PYTHONPATH}:/home/kyle/Code/Python/"
export EDITOR="vim"
export TERMINAL="termite"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERM=xterm-256color
# fix "xdg-open fork-bomb" export your preferred browser from here
