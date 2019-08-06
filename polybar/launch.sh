#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
#Get monitors
monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)

#If only 1 montor set it as default
if [ ${#monitors[@]} == "0" ]; then
	MONITOR="${monitors[0]}" polybar main &
	MONITOR="${monitors[0]}" polybar bottom &
else #with more screen set the "bigger" as main
	for m in $monitors; do
	  if [ $m == "eDP-1" ]; then
			MONITOR=$m polybar secondary &
		else
			MONITOR=$m polybar main &
			MONITOR=$m polybar bottom &
	  fi
	 done

fi
fi


