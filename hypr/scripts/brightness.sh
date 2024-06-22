#!/usr/bin/bash
if [[ "$1" == "inc" ]] then
	brillo -q -A 3 -u 300000
else
	brillo -q -U 3 -u 300000
fi

brillo -O

#dunstify  "Brightness: $(brillo)" \
#-h "string:x-dunst-stack-tag:test"
