while [ 1 ];
do
	echo here
	currentlevel=$(cat /sys/class/power_supply/BAT0/capacity)

	if [ $currentlevel -le 20 ];
	then
		brillo -S 30 -u 300000
		dunstify --appname="Screenshot" --timeout=7000 --urgency=critical "Battery level low: $currentlevel"

	elif [ $currentlevel -le 5 ];
	then
		dunstify --appname="Screenshot" --timeout=7000 --urgency=critical "Battery level critical: $currentlevel\nEntering sleep"
		systemctl suspend

	fi
	sleep 60; 
done
