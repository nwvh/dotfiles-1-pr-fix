#!/bin/bash

source $HOME/.config/awesome/colors/scripts/desktop.sh

# Colors
BG="#000f14"
FG="#a0a0b4"
BL="#0a191e"
WH="#a0a0b4"
R="#824655"
G="#468264"
Y="#827d50"
B="#326482"
M="#645078"
C="#327d7d"

# func - background - foreground - selected background - selected foreground
run $BG $FG $BL $FG 
# func - enable/disable - radius - x offset - y offset - opacity
comp 'true' '25' '-25' '-25' '.5' 
# func - foreground - background - black - green - red - blue
lock $FG $BG $BL $G $R $B 
# func (change colors in #Colors section)
term 
# func - gtk - icons 
gtk 'sakura' 'sakura' 
# func - background - foreground - alt foreground
browser $BG $FG '#4d4d54' 
# func - background - background 2 - background 3 - foreground
chan $BG '#09151a' '#0a191e' $FG 
# func - background - background 2 - background 3 - foreground
page $BG '#09151a' '#0a191e' $FG 
# func - background - foreground
zath $BG $FG 
# func - background image - background color - alt foreground - sel foreground
sddm 'sakura.jpg' $BG '#767685' $FG
# func - theme
awes 'sakura'
