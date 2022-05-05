if [ -f ~/.config/zsh/.zshrc ]; then
	. ~/.config/zsh/.zshrc
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GOPATH="$HOME/go"
export GOROOT="$HOME/sdk/go1.18"
export PICO_SDK_PATH="$HOME/pico/pico-sdk"
export LD_LIBRARY_PATH="/home/ksnyder/.pyenv/versions"

# User specific environment and startup programs
#export PATH=$PATH:"$(du $HOME/.local/bin | cut -f2 | paste -sd ':')"
export PATH=$PATH:$HOME/.local/bin/:$HOME/.pyenv/bin:$HOME/.poetry/bin:$HOME/sdk/julia-1.6.3/bin:${GOPATH}/bin:$HOME/.nimble/bin:$HOME/.cargo/bin
export PYTHONPATH="{PYTHONPATH}:/home/ksnyder/Code/Python/"
export EDITOR="nvim"
export READER="zathura"
export TERMINAL="st"
export BROWSER="vivaldi-stable"
export VIEWER="ristretto"
export FILE="lf"
export TOUCH_STATUS=1

export NNN_FALLBACK_OPENER=xdg-open
export NNN_FALLBACK_OPENER=zathura

export GPG_TTY=$(tty)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
