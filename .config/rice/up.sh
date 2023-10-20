#!/bin/bash
# deps
#   lemonbar

integers=($(leftwm-state -qn -t "/home/ksnyder/.config/rice/screen.liquid" | grep -Eo '[0-9]+' | head -n 4))

WIDTH=${integers[0]}
CENTER=$(($WIDTH/2))
X_OFFSET=$((($WIDTH-$CENTER)/4))
BAR_WIDTH=$(($WIDTH-($X_OFFSET*2))) # Size of bar
BAR_HEIGHT=30 # Size of bar
Y_OFFSET=5

sizes="${BAR_WIDTH}x$BAR_HEIGHT+$X_OFFSET+$Y_OFFSET"

/home/ksnyder/.config/rice/mybar | lemonbar -p -f '-*-tamzen-*-*-*-*-16-*-*-*-*-*-*-*' -g $sizes -B '#282828' -F '#83a598'