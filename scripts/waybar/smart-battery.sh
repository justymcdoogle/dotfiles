#!/bin/bash

while true; do
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)

    if [ "$capacity" -le 10 ]; then
        # Critical: precise, fast updates
        precise=$(awk "BEGIN {printf \"%.2f\", $(cat /sys/class/power_supply/BAT1/energy_now) / $(cat /sys/class/power_supply/BAT1/energy_full) * 100}")
        icon=""
        echo "{\"text\":\"$precise% $icon\",\"tooltip\":\"Critical battery\",\"class\":\"critical\"}"
        sleep 5
    elif [ "$capacity" -le 30 ]; then
        # Warning: normal precision, moderate updates
        icon=""
        echo "{\"text\":\"$capacity% $icon\",\"tooltip\":\"Warning\",\"class\":\"warning\"}"
        sleep 30
    else
        # Normal: slow updates
        [ "$capacity" -ge 80 ] && icon="" || icon=""
        echo "{\"text\":\"$capacity% $icon\",\"tooltip\":\"Normal\",\"class\":\"normal\"}"
        sleep 60
    fi
done
