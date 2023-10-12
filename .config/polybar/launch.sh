#!/bin/bash

THEME="mikalsqwe"
# THEME="ericmurphyxyz"

# Terminate already running bar instances
killall -q polybar
killall -q i3bar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

CONFIG_DIR=~/.config/polybar/$THEME/config.ini
polybar --reload --quiet top -c $CONFIG_DIR
echo "Polybar launched..."
