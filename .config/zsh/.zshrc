# Config file for ZSH
export GPG_TTY=$(tty)

# Enable colors and change prompt
autoload -U colors && colors
setopt autocd # Automatically cd into typed directory
stty stop undef # Disable ctrl-s to freeze terminal.

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == '' ]];
  then
    echo " "
  else
    echo ' '$branch' '
  fi
}

setopt prompt_subst

PS1='%B% %{$fg[magenta]%}%~%{$fg[green]$(git_branch_name)%}%{$fg[yellow]%}>>%{$reset_color%}%b '

# Include user@hostname
#PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[cyan]$(git_branch_name)%}%{$reset_color%}>>%b '

# History cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# System Maintenance
alias sdn="sudo shutdown now"

# Navigation
alias cdb="~/.local/bin"
alias cdc="~/.config/"
alias cdr="~/Code/Rust"
alias cdj="~/Code/Julia"
alias cddoc="~/Documents"
alias cdp="~/Pictures"
alias cdd="~/Downloads"
alias cdt="~/Templates"
alias cdm="~/Music"
alias cdnotes="~/Tresorit/notable/notes"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias scripts="/usr/bin/git --git-dir=$HOME/.scripts/ --work-tree=$HOME"
alias jdev="~/.julia/dev"

# Some aliases
alias e="$EDITOR"
alias ev="e ~/.config/nvim/init.vim"
alias ezrc="e ~/.config/zsh/.zshrc"
alias ezp="e ~/.zprofile"
alias ka="killall"
alias jn="jupyter notebook"
alias vv="pyenv version"
alias ls="ls --color=auto"
alias code="code-oss"

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
