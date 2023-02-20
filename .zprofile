export GPG_TTY=$(tty)

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

export PATH=$PATH:$HOME/.local/bin/:$HOME/.pyenv/bin:$HOME/.poetry/bin:$HOME/sdk/julia-1.8.0/bin:${GOROOT}/bin:$HOME/.cargo/env:$HOME/go/bin
export PYTHONPATH="{PYTHONPATH}:/home/ksnyder/Code/Python/"
export EDITOR="nvim"
export READER="zathura"
export TERMINAL="alacritty"
export BROWSER="firefox"
export VIEWER="sxiv"
export FILE="lf"
export TOUCH_STATUS=1
