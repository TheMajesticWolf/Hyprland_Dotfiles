#!/usr/bin/bash
output_path="Screenshot_$(date +'%Y-%m-%d')_$(date +'%H:%M:%S')"

if [[ "$1" = "select"  ]];
then
	grim -g "$(slurp)" "/home/aditya/Pictures/Screenshots/$output_path.png"
	# echo "In if"
else
	grim  "/home/aditya/Pictures/Screenshots/$output_path.png"
	# echo "In else"
fi

dunstify --appname="Screenshot" \
--timeout=3000 \
--urgency=normal \
"Screenshot saved at $output_path"
