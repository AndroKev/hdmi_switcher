#!/bin/bash
#Dieses Scrip dient dazu den VGA-Monitor abzuschalten und stattdessem 
#hdmi zu verwenden (inkl. sound)
#wird das eingestellte Programm wieder beendet, stellt er alles wieder 
#zurück es muss die datei /etc/pulse/default.pa von
#
#load-module module-stream-restore
#auf
#load-module module-stream-restore restore_device=false
#geändert werden

pacmd set-default-sink alsa_output.pci-0000_01_05.1.hdmi-stereo
pacmd set-default-source alsa_output.pci-0000_01_05.1.hdmi-stereo.monitor
xrandr --output VGA-0 --off --output HDMI-0 --auto

xdotool mousemove `xdotool getdisplaygeometry`

vlc --play-and-exit --no-loop -f "$1" #wird noch durch xbmc ersetzt

pacmd set-default-sink alsa_output.pci-0000_00_14.2.analog-stereo
pacmd set-default-source alsa_output.pci-0000_00_14.2.analog-stereo.monitor
xrandr --output VGA-0 --auto --output HDMI-0 --off

