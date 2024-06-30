fish_config theme choose "Catppuccin Mocha"
set -g fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
    #common commands
    #§alias grep 'grep --color-auto'
    alias pacman 'pacman --color=auto'
    alias yay 'yay --color=auto'
    alias less 'less -N' #enable line number
    alias ls 'eza'
    alias logout='hyprctl dispatch exit' # logout hyprland
    #moving
    alias ... 'cd ../../'
    alias .... 'cd ../../../'

    set -x VISUAL vim

    function wificonnect
	    nmcli device wifi connect "$argv[1]" password "$argv[2]"
    end
    #flex onem
    fastfetch
end

# Created by `pipx` on 2024-06-11 11:50:06
set PATH $PATH /home/jacob/.local/bin
