isshaderset=$(hyprctl getoption decoration:screen_shader | awk 'NR==2 {print $2}')
shaderpath=$(hyprctl getoption decoration:screen_shader | awk 'NR==1 {print $2}' | awk -F='/' '{print $0}')
shadername=$(echo "$shaderpath" | awk -F '/' '{print $5}' | awk -F '.' '{print $1}')

if [[ $shadername == "invert" ]];
then
	hyprctl keyword "decoration:screen_shader" "~/.config/hypr/shaders/actual.frag"
else
	hyprctl keyword "decoration:screen_shader" "~/.config/hypr/shaders/invert.frag"
fi

