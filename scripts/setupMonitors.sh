#!/usr/bin/env bash

hostname=$(</etc/hostname)

# configuration for desktop pc at home
if [[ "$hostname" == "thetower" ]]; then
    echo "Setting up monitors for home desktop pc"
    xrandr --output DP-2 --left-of DVI-I-0 --primary
    exit 1
else
    echo "$hostname does not have a monitor configuration"
    exit -1
fi
