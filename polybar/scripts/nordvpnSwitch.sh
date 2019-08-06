#!/bin/sh
if [ "$(nordvpn status | awk '/Status/ { print $2 }')" == "Connected" ]
then
	nordvpn d
else
	#If you want to use this change this ;D
	nordvpn c Netherlands
fi
