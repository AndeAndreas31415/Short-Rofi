#!/usr/bin/env bash
# a script for output the shortcuts in the active window
# need to install: xdotool , rofi , xsel

# automatic execution of the shortcut (yes/no)
# this fuction is not available
readonly Run_shortcut="no"
readonly Debug_active="yes"

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
		re="tmux\n"
		#Terminal with tmux
		re+="Shortcuts for "
		case $if_tmux_acti in
#			*"$Custom"*)	re="$Custom";;
			*"vim"*)	re+="Vim";;
			*)		re+="nothing";;
		esac
	else
		#Terminal default
		ter_win=($(echo $window|tr "-" "\n"))
		case ${ter_win[1]} in
#			*"$Custom"*)	re="$Custom";;
			*"vim"*)	re="Vim";;
			*)		re="nothing";;
		esac
	fi
	if [[ "$re" == *"nothing" ]]
	then
		re=$(echo -e $re|head -n -1)
	fi
	echo $re
#	return $re
}

#cat the shortcuts file
second_frame(){
#	a debug message
#	echo "Debug 2"
	Program=$(echo $3)
	Path_Pro=$(echo $Keys_Dir/$Program".txt")
	if [[ "$Debug_active" == "yes" ]]
	then
		echo -e "Debug file name: " $Path_Pro
	fi

	string_keys="{ back to menu \n"
	string_keys+=$(cat $Path_Pro)
	echo -e "${string_keys}"
}

#it doesn't work
run_short_func(){
	if [[ "$Run_shortcut" == *"yes"* ]]
	then
		#special thank go to "https://github.com/raphaelfournier/rofi-modi-snippets"
		coproc(xdotool key $2)
	fi
	exit0
}

# This Fuction is for output all Shortcuts Files(all support programms)
search_key(){
	echo -e "{ back to menu"
	echo $Keys|tr ' ' '\n'|sed "s/^/Shortcuts for /g"
}

#jump from 2.menu to the 1.menu
go_back(){
	main
}

#select programm window
main(){
#	a debug message
#	echo "Debug 1"

	Output_Main="All Shortcuts \n"
#	Output_Main+="Shortcuts for Xfce4 \"Display Manager\"\n"

	Output_Main+="Shortcuts for "
	case $window in
#		*"$Custom"*)	Output_Main+="$Custom";;"
		*"Ardour"*)     Output_Main+="Ardour";;
		*"Arduino"*)	Output_Main+="Arduino";;
		*"Atom"*)	Output_Main+="Atom";;
		*"Blender"*)	Output_Main+="Blender";;
		*"Chrome"*)	Output_Main+="Chrome";;
		*"Chromium"*)	Output_Main+="Chromium";;
		*"Code - OSS"*)	Output_Main+="VSCode";;
		*"Firefox"*)	Output_Main+="Firefox" ;; #&& Next="firefox";;
		*"gedit"*)	Output_Main+="Gedit";;
		*"GNU Image Manipulation Program"*)	Output_Main+="Gimp";;
		*"GIMP"*)	Output_Main+="Gimp";;
		*"KiCad"*)      Output_Main+="Kicad";;
		*"Krita"*)      Output_Main+="Krita";;
		*"mpv"*)	Output_Main+="mpv";;
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
	
	if [[ "$Debug_active" == "yes" ]]
	then
		echo -e "Debug window_name: " $window
	fi
	echo -e "${Output_Main}"
}

if [[ "$Debug_active" == "yes" ]]
then
	echo -e "Debug args: " $@
fi


if [[ "$@" ]]
then
	if [[ "$1" == "->"* ]]
	then
		run_short_func $1 $2
	elif [[ "$1" == "All"* ]]
	then
		search_key
	elif [[ "$1" == "{"* ]]
	then
		go_back $@
	else
		second_frame $1 $2 $3
	fi
else
	main
fi
