starship init fish | source

set fish_vi_mode 1

direnv hook fish | source

set -gx GOPATH $HOME/go
set -gx GOROOT $HOME/sdk/go1.18

set -gx PATH $HOME/.local/bin $HOME/.poetry/bin $HOME/.pyenv/bin $HOME/sdk/go1.18/bin $HOME/.cargo/bin $HOME/.nimble/bin $HOME/go/bin $PATH

set -gx GPG_TTY $(tty)
set -gx EDITOR vis
set -gx READER zathura
set -gx TERMINAL kitty
set -gx BROWSER firefox
set -gx VIEWER sxiv
set -gx FILE lf
set -gx TOUCH_STATUS 1
