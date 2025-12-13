#!/bin/bash

if hyprctl clients -j | jq -e '.[] | select(.workspace.name == "special:scratchpad" and .class == "kitty-scratchpad")' > /dev/null; then
    hyprctl dispatch togglespecialworkspace scratchpad
else
    kitty --class kitty-scratchpad &
fi
