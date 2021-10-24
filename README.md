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
<ol>Needed: <b>xdotool , rofi , xsel</b><br>
<ol>Debian / Ubuntu / ... <code>sudo apt-get install xdotool rofi xsel</code><br>
Arch / Manjaro / ... <code>sudo pacman -S xdotool rofi xsel --needed</code>
</ol>
</ol>
<ol><code>git clone https://github.com/AndeAndreas31415/Short-Rofi.git $HOME/.config/rofi/</code></ol>
<ol><code>chmod +x $HOME/.config/rofi/rofi-shortcuts.sh</code></ol>

### Run this command from Cli (*Terminal*)
<ol><code>rofi -modi shortcut:$HOME/.config/rofi/rofi-shortcut.sh -show shortcut</code></ol>

<details>
<summary style="zoom:150%;font-weight:bold;">Add the script to rofi modi</summary></br>
Edit the *config from rofi*:</br>
<code>vim $HOME/.config/rofi/config.rasi</code></br>
or</br>
<code>quot;Your favorit text editor" $HOME/.config/rofi/config.rasi</code></ol></br></br>
add in the line "modi":</br>
<ol><code><b>shortcuts:$HOME/.config/rofi/rofi-shortcuts.sh</b></code></ol>
Example:</br>
<ol><code><i>modi: "drun,window,shortcuts:$HOME/.config/rofi/rofi-shortcut.sh,";</i></code></ol>
And than can show you with command:</br>
<ol><code>rofi -show shortcuts</code></ol>
</details>
<br>
## Features
<ol>You must edit the File to activate this Features</ol>
- automatic execution of the shortcut (line 7 no->yes)
- debug messages (line 8 no->yes)


On this [Site](https://github.com/AndeAndreas31415/Short-Rofi/wiki/supported-sheet) can you look whiche programms are supported:
[Supported Programms](https://github.com/AndeAndreas31415/Short-Rofi/wiki/supported-sheet)

ToDo:

- automatic key press (have you a idea then try them out and then send me the solution)
- add more cheat sheet

Ideas and solutions send it to me  [E-mail:(andreas_coding@gmx.de)](andreas_coding@gmx.de)

P.s.: <u><i><b>Please read the [wiki](https://github.com/AndeAndreas31415/Short-Rofi/wiki)</b></i></u>

<!-- Variables for this Readme file-->

[License]: https://img.shields.io/badge/License-MIT-blue
[Version]: https://img.shields.io/badge/Version-v1.0-red
[L-link]: ./LICENSE
