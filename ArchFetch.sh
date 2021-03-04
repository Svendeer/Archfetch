#!/bin/bash

# Maded by Svendeer
# A simple fetch script to show information of your Arch Linux system

YELLOW='\033[1;33m'
WHITE='\033[1;37m'
BLUE='\033[1;34m'

LBLUE='\033[0;34m'
LWHITE='\033[1;37m'

userName(){
    bgColour="^bg($backgroundColour)"
    #foregroundColour="^fg(#ffffff)"
    echo "${YELLOW}| I am: ${LWHITE}$USER"
}

getDistroName(){
    myDistro=$(lsb_release -si)
    echo "${YELLOW}| I Use: ${LWHITE}$myDistro Linux."
}

kernelVersion(){
    kernel=$(uname -r)
    echo "${YELLOW}| Kernel: ${LWHITE}$kernel"
}

distroUptime(){
    up=$(uptime -p)
    echo "${YELLOW}| Uptime: ${LWHITE}$up"
}

packagesList(){
    pkgs=$(pacman -Qq | wc --lines)
    echo "${YELLOW}| There are: ${LWHITE}$pkgs packages"
}

getShell(){
    shell="${SHELL##*/}"
    echo "${YELLOW}| My shell is: ${LWHITE}$shell"
}

currentEnvironment(){
    environment=$XDG_CURRENT_DESKTOP
    
    if [[ $environment == "" ]];
    then
        wm=$(wmctrl -m | grep Name | awk '{printf $2}')
        echo "${YELLOW}| I'm using: ${LWHITE}$wm"
    else
        echo "${YELLOW}| I'm using: ${LWHITE}$environment"
    fi
}

myTerminal(){
    term=$TERM
    case $term in
        xterm-256color )
             terminal="Konsole"
            ;;
        st-256color)
            terminal="ST-Terminal"
            ;;
    esac
    echo "${YELLOW}| My terminal is: ${LWHITE}$terminal"
}

colourPalette(){
    c0='[0m'
    c1='[31m'; c2='[32m'
    c3='[33m'; c4='[34m'
    c5='[35m'; c6='[36m'
    c7='[37m'; c8='[38m'
    c9='^[[37m'
    
    paleta="[7m$c1 $c1 $c2 $c2 $c3 $c3 $c4 $c4 $c5 $c5 $c6 $c6 [m"
    echo $paleta
}

echo -e ${BLUE} '       .       ' $(userName)    
echo -e ${BLUE} '      / \      ' $(getDistroName)
echo -e ${BLUE} '     /   \     ' $(packagesList)
echo -e ${BLUE} '    /^.   \    ' $(distroUptime)
echo -e ${BLUE} '   /  .-.  \   ' $(kernelVersion)
echo -e ${BLUE} '  /  (   ) _\  ' $(myTerminal)
echo -e ${BLUE} ' / _.~   ~._^\ ' $(getShell)
echo -e ${BLUE} '/.^         ^.\' $(currentEnvironment)
echo -e "  "$(colourPalette)

