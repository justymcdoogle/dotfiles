#!/bin/bash

# Recursive grep to find all binds
grep -rhE '^bind[a-z]*\s*=' ~/.config/hypr/ | \
    sed 's/\$mainMod/SUPER/g; s/mod4/SUPER/g; s/bind[a-z]*\s*=\s*//g' | \
    awk -F, '{
        # Trim whitespace for all parts
        for(i=1; i<=NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i);

        # Logic for mapping Keys
        if ($1 ~ /XF86/ || $1 == "") {
            keys = ($1 == "" ? $2 : $1);
            remainder = $3 " " $4;
        } else {
            keys = $1 " + " $2;
            remainder = ""; for(i=3; i<=NF; i++) remainder = remainder $i (i==NF?"":" ");
        }

        # Check if there is a comment (#) in the remainder
        if (remainder ~ /#/) {
            split(remainder, parts, "#");
            gsub(/^[ \t]+|[ \t]+$/, "", parts[2]); # The Label
            action = parts[2];
        } else {
            action = remainder; # Fallback to raw command
        }

        if (keys != "")
            printf "%-20s  ➜   %s\n", keys, action
    }' | \
    rofi -dmenu -i -p "󰌌 Keybinds" \
    -theme-str 'window {width: 45%;} listview {columns: 1; lines: 15;}'
