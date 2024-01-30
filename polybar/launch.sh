#! /bin/sh

# Terminate already running bar instaces
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar workspaces &
polybar spotify &
polybar clock &
polybar ping-kb &
polybar cpu-ram &
polybar power-menu &
