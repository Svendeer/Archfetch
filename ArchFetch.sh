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
    environment=$(wmctrl -m | grep Name | awk '{printf $2}')
    echo "${YELLOW}| My WM is: ${LWHITE}$environment"
}

myTerminal(){
    echo "${YELLOW}| This terminal is: ${LWHITE}$TERM"
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

l1='       .       '       
l2='      / \      '
l3='     /   \     '
l4='    /^.   \    '
l5='   /  .-.  \   '
l6='  /  (   ) _\  '
l7=' / _.~   ~._^\ '
l8='/.^         ^.\'

echo -e '__________________________'
echo -e ${BLUE}$(l1)'|'$(userName)
echo -e ${BLUE}$(l2)'|'$(getDistroName)
echo -e ${BLUE}$(l3)'|'$(packagesList)
echo -e ${BLUE}$(l4)'|'$(distroUptime)
echo -e ${BLUE}$(l5)'|'$(kernelVersion)
echo -e ${BLUE}$(l6)'|'$(myTerminal)
echo -e ${BLUE}$(l7)'|'$(getShell)
echo -e ${BLUE}$(l8)'|'$(currentEnvironment)
echo -e "  "$(colourPalette)
