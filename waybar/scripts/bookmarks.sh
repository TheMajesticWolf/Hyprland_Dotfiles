#!/usr/bin/bash
options="Reddit\nNetflix\nAmazon\nTesseract\nProject_School\nArchWiki\nGitHub\nChatGPT\nYouTube\nAWS_Console\nGmail\nSmashKarts\nDeadshot"

declare -A urls_dict

urls_dict[reddit]="https://reddit.com"
urls_dict[netflix]="https://netflix.com"
urls_dict[amazon]="https://amazon.com"
urls_dict[tesseract]="https://tesseractonline.com"
urls_dict[project_school]="https://ps.kmitonline.com"
urls_dict[archwiki]="https://archlinux.org"
urls_dict[github]="https://github.com"
urls_dict[aws_console]="https://aws.console.com"
urls_dict[youtube]="https://youtube.com"
urls_dict[chatgpt]="https://chat.openai.com"
urls_dict[gmail]="https://mail.google.com"
urls_dict[smashkarts]="https://smashkarts.io"
urls_dict[deadshot]="https://deadshot.io"

#for key in ${!urls_dict[@]};
#do
#	echo "${key} - ${urls_dict[${key}]}"
#done

option=$(echo -e "$options" | rofi -dmenu -i -p "Open" -no-custom -theme-str "listview {columns: 3; lines: 3;}")
option=$(echo "$option" | awk '{print tolower($0)}')

if [[ -z "$option" ]];
then
	exit 0
fi

firefox --private-window "${urls_dict[${option}]}" &

#is_firefox_running=$(ps -e | grep "firefox")

