#!/bin/sh

export GTK_THEME="Rosepine-Dark"

dir="$HOME/Pictures/Screenshots"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

tmpfile="$(mktemp --suffix=.png)"
grim -g "$(slurp)" "$tmpfile" || exit 1

yad --title="Screenshot Options" \
    --text="<span font='15' weight='bold'>What do you want to do with the screenshot?</span>" \
    --button="Copy:0" \
    --button="Save:1" \
    --button="Discard:2" \
    --center \
    --on-top \
    --width=400 \
    --height=100 \
    --align=0

result=$?

case "$result" in
    0)  # Copy Only
        wl-copy < "$tmpfile"
        rm "$tmpfile"
        notify-send -u low "Screenshot copied to clipboard"
        ;;
    1)  # Save & Copy
        mv "$tmpfile" "$file"
        wl-copy < "$file"
        notify-send -u low "Screenshot saved & copied" "$file"
        ;;
    *)  # Discard
        rm "$tmpfile"
        notify-send -u low "Screenshot discarded"
        ;;
esac
