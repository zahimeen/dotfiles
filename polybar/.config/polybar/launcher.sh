#!/usr/bin/env bash

# Kill All Instances Of Polybar

killall -q polybar

# Launch Bar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar main &
