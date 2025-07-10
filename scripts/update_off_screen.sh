#!/usr/bin/env bash
brightnessctl -s -d backlight_warm
brightnessctl -s -d backlight_cool
brightnessctl set -d 'backlight_warm' 0
brightnessctl set -d 'backlight_cool' 0

freeze --execute "zsh -c 'echo btw i run; fastfetch --pipe false'" \
    -W 1872 -H 1404 -o /tmp/btw.png \
    --font.family "Adwaita Mono" \
    --font.size=30 \
    --theme solarized-light

set-off-screen.py /tmp/btw.png