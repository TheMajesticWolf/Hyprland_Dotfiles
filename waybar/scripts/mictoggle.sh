#!/usr/bin/bash

ismuted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}' | wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}' | sed 's/\[\([^][]*\)\]/\1/g')

if [[ "$ismuted" == "MUTED" ]];
then
	#wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
	echo "{\"text\": \"\", \"alt\": \"alt\", \"tooltip\": \"Muted\", \"class\": \"muted\"}"
else
	#wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
	echo "{\"text\": \"\", \"alt\": \"alt\", \"tooltip\": \"Unmuted\", \"class\": \"unmuted\"}"
fi

