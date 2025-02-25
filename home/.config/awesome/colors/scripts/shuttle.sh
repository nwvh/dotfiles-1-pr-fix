#!/bin/bash

source $HOME/.config/awesome/colors/scripts/desktop.sh

# Colors
BG="#dedcdf"
FG="#4b4b4b"
BL="#4b4b4b"
WH="#c8c3c8"
R="#cd8c8c"
G="#91c8a0"
Y="#dcbe91"
B="#96a5cd"
M="#b996cd"
C="#96cdbe"

# func - background - foreground - selected background - selected foreground
run $BG $FG $WH $FG
# func - enable/disable - radius - x offset - y offset - opacity
comp 'true' '25' '-25' '-25' '.1' 
# func - foreground - background - black - green - red - blue
lock $BG $FG $BL $G $R $B 
# func (change colors in #Colors section)
term 
# func - gtk - icons 
gtk 'shuttle' 'shuttle' 
# func - background - foreground - alt foreground
browser $BG $FG '#a5a5a5' 
# func - background - background 2 - background 3 - foreground
chan $BG '#d8d6d9' '#d3d1d4' $FG 
# func - background - background 2 - background 3 - foreground
page $BG '#d8d6d9' '#d3d1d4' $FG 
# func - background - foreground
zath $BG $FG
# func - background image - background color - alt foreground - sel foreground
sddm 'shuttle.png' $BG '#5e5e5e' $FG
# func - theme
awes 'shuttle'
