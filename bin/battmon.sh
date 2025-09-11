#!/usr/bin/env bash

# ------------------------------------------------------------------
# Script Name:   battmon.sh
# Description:   A Simple Bash Script for Battery Level Charge
#                Notifications
# Website:       https://gist.github.com/ostechnix
# ------------------------------------------------------------------

while [[ true ]]; do
    # Define thresholds
    HIGH_THRESHOLD=79
    LOW_THRESHOLD=25

    # Get the battery level
    LEVEL=$(acpi -b | awk -F', ' '{print $2}' | tr -d '%,')
    STATUS=$(acpi -b | awk -F': ' '{print $2}' | awk -F', ' '{print $1}')

    # Ensure LEVEL is a valid number
    if [[ "$LEVEL" =~ ^[0-9]+$ ]]; then
        # Check for high battery level
        if [[ "$LEVEL" =~ ^[0-9]+$ ]]; then
            if [ "$STATUS" = "Charging" ] && [ "$LEVEL" -ge "$HIGH_THRESHOLD" ]; then
                notify-send -t 9000 "Battery Full" "Your battery is now fully charged."
            fi
        fi

        # Check for low battery level
        if [[ "$LEVEL" =~ ^[0-9]+$ ]]; then
            if [ "$STATUS" = "Discharging" ] && [ "$LEVEL" -le "$LOW_THRESHOLD" ]; then
                notify-send -t 9000 "Battery Low" "Your battery is critically low. Please plug in your charger!"
            fi
        fi
    fi
    sleep 90
done
