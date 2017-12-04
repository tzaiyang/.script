#!/bin/bash
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode VGA-1-1 1920x1080
xrandr --output VGA-1-1 --off
xrandr --output VGA-1-1 --mode 1920x1080 --auto --right-of DVI-D-0
