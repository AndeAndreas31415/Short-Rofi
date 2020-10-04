# Short-Rofi

[![][License]][L-link]
![][Version]

This Projeck is based off [Rofi](https://github.com/davatorium/rofi)

This script put out shortcuts about the active programm. 

## Screenshots
an example with vim 

<!--Main frame-->
<a href="https://ibb.co/MRPPsLM"><img src="https://i.ibb.co/HrGGVQn/programm-list.png" alt="programm-list" border="0"></a>

<!--2.frame-->
<a href="https://ibb.co/wh6RMrK"><img src="https://i.ibb.co/xq5DJ8M/key-list.png" alt="key-list" border="0"></a>


## How to add to rofi:
​	`git clone https://github.com/AndeAndreas31415/Short-Rofi.git $HOMsE/.config/rofi/`
</br>
​	`chmod +x $HOME/.config/rofi/rofi-shortcuts.sh`	

### Run this command from Cli (*Terminal*)

​	`rofi -modi shortcut:$HOME/.config/rofi/rofi-shortcut.sh -show shortcut`

### Add the script to rofi modi 

Edit the *config from rofi*:

​	​	`nano $HOME/.config/rofi/config.rasi`
</br>
or
</br>
​	​	`vim $HOME/.config/rofi/config.rasi`
</br>
or 
</br>
​	​	`$"Your favorit text editor" $HOME/.config/rofi/config.rasi`

add in the line "modi":</br>
​	<u>shortcuts:$HOME/.config/rofi/rofi-shortcuts.sh</u> 

Example:</br>
​	*modi: "drun,window,shortcuts:$HOME/.config/rofi/rofi-shortcut.sh,";*

And than can show you with command:</br>
​	`rofi -show shortcuts`

On this [Site](https://github.com/AndeAndreas31415/Short-Rofi/wiki/supported-sheet) can you look whiche programms are supported:
[Supported Programms](https://github.com/AndeAndreas31415/Short-Rofi/wiki/supported-sheet)

ToDo:

- automatic key press (have you a idea then try them out and then send me the solution)
- add more cheat sheet

Ideas and solutions send it to me  [E-mail:(andreas_coding@gmx.de)](andreas_coding@gmx.de)

P.s.: <u><i><b>Please read the [wiki](https://github.com/AndeAndreas31415/Short-Rofi/wiki)</b></i></u>

<!-- Variables for this Readme file-->

[License]: https://img.shields.io/badge/License-MIT-blue
[Version]: https://img.shields.io/badge/Version-Beta-red
[L-link]: ./LICENSE
