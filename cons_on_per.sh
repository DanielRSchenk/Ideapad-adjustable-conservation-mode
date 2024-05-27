#!/bin/bash

if [ "$1" ]; then
    threshold="$1"
else
    echo "Usage: $0 <battery_threshold>"
    exit 1
fi

echo "keep terminal open, minimum percentage is 60%"

while true; do
    current_battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}' | tr -d '%')
    if [ "$current_battery" \> "$threshold" ]; then
        echo "Battery level above threshold ($current_battery%); executing cons_on"
        sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode <<<1
        break
    fi
    sleep 30
done

