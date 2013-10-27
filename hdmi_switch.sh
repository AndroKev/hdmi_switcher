#!/bin/bash

hdmi_state=`xrandr | grep -c "VGA-0 connected 1280x1024"`
indexnr=(`pacmd list-sink-inputs | grep 'index' | cut -d: -f2` )

if [ $hdmi_state -eq 1 ]; then
	for i in "${indexnr[@]}"
		do
		`pacmd move-sink-input $i alsa_output.pci-0000_01_05.1.hdmi-stereo`
		done
	pacmd set-default-sink alsa_output.pci-0000_01_05.1.hdmi-stereo
	pacmd set-default-source alsa_output.pci-0000_01_05.1.hdmi-stereo.monitor
	xrandr --output VGA-0 --off --output HDMI-0 --auto

else
	
	for i in "${indexnr[@]}"
		do
		`pacmd move-sink-input $i alsa_output.pci-0000_00_14.2.analog-stereo`
		done
	pacmd set-default-sink alsa_output.pci-0000_00_14.2.analog-stereo
	pacmd set-default-source alsa_output.pci-0000_00_14.2.analog-stereo.monitor
	xrandr --output VGA-0 --auto --output HDMI-0 --off
fi
