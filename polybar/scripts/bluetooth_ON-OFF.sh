#!/bin/bash

if [ "$(bluetoothctl show | awk '/Powered/ { print $2 }')" == "no" ]
then
	bluetoothctl power on
else
	bluetoothctl power off
fi
