#!/bin/bash

# Check if polybar is already running
if pgrep -x polybar > /dev/null; then
    echo "Polybar is already running"
    exit 1
fi

# Launch polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi

echo "Polybar started..."
