#!/bin/bash

#xrandr --newmode "1600x900_75.00" 151.25 1600 1704 1872 2144 900 903 908 942 -hsync +vsync
#xrandr --addmode VGA1 "1600x900_75.00"

second=$(xrandr | grep -c "DP-2 connected");
if [ $second -eq 1 ] 
then
	xrandr --output DP-3 --mode 1920x1200 --pos 0x0 --rotate normal --output DP-2 --mode 1920x1200 --pos 1920x0
else
	third=$(xrandr | grep -c "VGA1 connected");
	if [ $third -eq 1 ]
	then    
		xrandr --newmode "1600x900_75.00" 151.25 1600 1704 1872 2144 900 903 908 942 -hsync +vsync
		xrandr --addmode VGA1 "1600x900_75.00"
		xrandr --output VGA1 --mode "1600x900_75.00" --pos 1600x0
	else    
		third=$(xrandr | grep -c "VGA-1 connected");
		if [ $third -eq 1 ]
		then
			# xrandr --newmode "1600x900_75.00" 151.25 1600 1704 1872 2144 900 903 908 942 -hsync +vsync
			# xrandr --addmode VGA-1 "1600x900_75.00"
			# xrandr --output VGA-1 --mode "1600x900_75.00" --pos 1600x0
			xrandr --output VGA-1 --mode 1600x900 --pos 1600x0
		else
			xrandr --output LVDS-1 --mode 1600x900 --pos 0x0 --rotate normal
		fi
	fi
fi
