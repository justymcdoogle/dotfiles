#!/bin/bash

while true; do
    percentage=$(cat /sys/class/power_supply/BAT1/capacity)
    state=$(cat /sys/class/power_supply/BAT1/status)

    filled=$((percentage / 10))
    empty=$((10 - filled))

    bar_filled=$(seq 1 $filled | xargs printf '▰%.0s')
    bar_empty=$(seq 1 $empty | xargs printf '▱%.0s')

    bar="$bar_filled$bar_empty"

    if [ $state = 'Charging' ]; then
        charging_icon='⚡'
    else
        charging_icon=''
    fi

    if [ $percentage -ge 95 ]; then
        class='full'
    elif [ $percentage -ge 20 ]; then
        class='normal'
    elif [ $percentage -ge 11 ]; then
        class='warning'
    else
        class='critical'
    fi

    echo "{\"text\":\"$bar $percentage%$charging_icon\",\"class\":\"$class\"}"

    case "$class" in
        'full'|'normal') sleep 60 ;;
        'warning') sleep 30 ;;
        'critical') sleep 5 ;;
    esac

done
