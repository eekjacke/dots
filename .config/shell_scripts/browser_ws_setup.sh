#!/bin/sh

hyprctl dispatch focuswindow qutebrowser 
hyprctl dispatch togglefloating qutebrowser 
hyprctl dispatch resizeactive exact 50% 94% 
hyprctl dispatch moveactive exact 1% 5%