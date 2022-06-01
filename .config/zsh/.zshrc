# Config file for ZSH

# Enable colors and change prompt
autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%} >>%b "
setopt autocd # Automatically cd into typed directory
stty stop undef # Disable ctrl-s to freeze terminal.

# History cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# System Maintenance
alias sdn="sudo shutdown now"

# Navigation
alias cdb="~/.local/bin"
alias cdc="~/Code"
alias cddoc="~/Documents"
alias cdp="~/Pictures"
alias cdd="~/Downloads"
alias cdt="~/Templates"
alias cdm="~/Music"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias scripts="/usr/bin/git --git-dir=$HOME/.scripts/ --work-tree=$HOME"

# Some aliases
alias e="$EDITOR"
alias ka="killall"
alias jn="jupyter notebook"
alias nv="nvim"
alias vv="pyenv version"

# Internet
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias YT="youtube-viwer"

# Add path for func
fpath+=~/.zfunc

# AVR Serial
alias avrSerial="screen /dev/ttyUSB0 9600"

# Specifc to zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Change cursor shape for different vi modes
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
       echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} == '' ]] ||
         [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate vi insert as keymap
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use the beam shape cursor at startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
