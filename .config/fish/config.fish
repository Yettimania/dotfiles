starship init fish | source

set fish_vi_mode 1

set -U GOPATH $HOME/go
set -U GOROOT $HOME/sdk/go1.18

set -U PATH $HOME/.local/bin $HOME/.poetry/bin $HOME/.pyenv/bin $HOME/sdk/go1.18/bin $HOME/.cargo/env $HOME/go/bin $PATH

set -U GPG_TTY $(tty)
set -U EDITOR vis
set -U READER zathura
set -U TERMINAL kitty
set -U BROWSER firefox
set -U VIEWER sxiv
set -U FILE lf
set -U TOUCH_STATUS 1
