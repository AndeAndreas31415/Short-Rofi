#!/usr/bin/env bash
# a script for output the shortcuts in the active window
# need to install: xdotool , rofi , xsel

# automatic execution of the shortcut (yes/no)
# this fuction is not available
#readonly Run_shortcut="yes"

readonly window=$(xdotool getwindowfocus getwindowname)
readonly wn=$(xdotool getactivewindow)

readonly Keys_Dir="$HOME/.config/rofi/keys"
readonly Keys=$(ls $Keys_Dir|cut -d "." -f 1)
#readonly Num_Keys=$(ls $Keys_Dir|wc -l)

# if you have tmux
if [ -f /usr/bin/tmux ]
then
readonly if_tmux_acti=$(tmux list-panes -F '#{pane_active} #{pane_current_command}'|grep "1"|cut -d " " -f 2 )
fi

# a debug message
#echo "Debug 0"

terminal(){
	if [[ "$window" == *"tmux"* ]]
	then
		#Terminal with tmux
		case $if_tmux_acti in
#			*"$Custom"*)	re="$Custom";;
			*"vim"*)	re="Vim";;
			*)		re="";;
		esac
	else
		#Terminal default
		ter_win=($(echo $window|tr "-" "\n"))
		case ${ter_win[1]} in
#			*"$Custom"*)	re="$Custom";;
			*"vim"*)	re="Vim";;
			*)		re="";;
		esac
	fi
	echo $re
#	return $re
}
second_frame(){
#cat the shortcuts file 

#	a debug message
#	echo "Debug 2"
	
	Program=$(echo $3)
#	notify-send $Program
	Path_Pro=$(echo $Keys_Dir/$Program".txt")
#	echo $Path_Pro
	cat $Path_Pro
}

run_short_func(){
	if [[ "$Run_shortcut" == *"yes"* ]]
	then
		echo -n "Nothing"
#		xdotool key 0xff1b
#		a debug message
#		echo "Debug copy"
#		xdotool key --clearmodifiers --delay 1000 --window $wn $2
#		notify-send $wn
#		notify-send $(pwd)
#		echo -e "sleep 5 \nxdotool windowactivate "$wn" \nxdotool key "$2"\nnotify-send \"Nice it works\"">run-key.sh
	fi
	exit0
}

search_key(){
	echo $Keys|tr ' ' '\n'|sed "s/^/Shortcuts for /g"
}

main(){
#select programm window 
	
#	a debug message
#	echo "Debug 1"

	Output_Main="All Shortcuts \n"
#	Output_Main+="Shortcuts for Xfce4 \"Display Manager\"\n"

	Output_Main+="Shortcuts for "
	case $window in
#		*"$Custom"*)	Output_Main+="$Custom";;
		*"Arduino"*)	Output_Main+="Arduino";;
		*"Chrome"*)	Output_Main+="Chrome";;
		*"Chromium"*)	Output_Main+="Chromium";;
		*"Firefox"*)	Output_Main+="Firefox" ;; #&& Next="firefox";;
		*"gedit"*)	Output_Main+="Gedit";;
		*"GNU Image Manipulation Program"*)	Output_Main+="Gimp";;
		*"REAPER"*) 	Output_Main+="Reaper";;
		*"Typora"*)	Output_Main+="Typora";;
		*"Zrythm"*)	Output_Main+="Zrythm";;
		*"Terminal"*)	Output_Main+=$(terminal);;
		*)		Output_Main=$(echo -e $Output_Main|head -n -1);;
	esac
#	if [[ "$Next" == *"firefox"* ]]
#	then
#		Output_Main+="  └─ Shortcuts for "
#		Output_Main+=$(echo $window|grep -o "YouTube")
#	fi

	if [[ "$Output_Main" == *"Shortcuts for " ]]
	then
		Output_Main=$(echo -e $Output_Main|head -n -1)
	fi
	Output_Main+=" \n"

	echo -e "Debug window_name: " $window
	echo -e "${Output_Main}"
}

if [ "$@" ] 
then
	if [[ "$1" == *"->"* ]]
	then
		run_short_func $1 $2
	elif [[ "$1" == *"All"* ]]
	then
		search_key
	elif [[ "$1" == *"Sorry"* ]]
	then
		exit 0
	else
		second_frame $1 $2 $3
	fi
else
	main
fi
