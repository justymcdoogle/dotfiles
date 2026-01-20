#!/bin/bash
OUTPUT="$HOME/pkglist.txt"

# Get list of AUR packages
AUR_PKGS=$(pacman -Qqem)

pacman -Qi $(pacman -Qqe) | awk -v aur="$AUR_PKGS" '
    /^Name/ { 
        name = $3
        is_aur = 0
        split(aur, a, "\n")
        for (i in a) if (a[i] == name) is_aur = 1
        
        if (is_aur) {
            prefix = "[AUR] "
        } else {
            prefix = "[Repo]"
        }
    }
    /^Description/ {
        desc = $0
        gsub(/^Description[[:space:]]*:[[:space:]]*/, "", desc)
        printf "%-7s %-25s - %s\n", prefix, name, desc
    }
' > "$OUTPUT"
