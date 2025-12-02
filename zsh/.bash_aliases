# Keeps track of all packages installed (pacman)
packages() {
    echo "Gathering package information..." >&2
    pacman -Qi $(pacman -Qqe) | awk '
        /^Name/ { name = $3 }
        /^Description/ {
            desc = $0
            gsub(/^Description[[:space:]]*:[[:space:]]*/, "", desc)
            print name " - " desc
        }
    ' > ~/pkglist.txt
    echo "Package list with descriptions updated to pkglist.txt!"
}
