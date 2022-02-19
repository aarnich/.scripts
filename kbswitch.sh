#!/bin/bash
Icon="~/Pictures/Icons/on.png"
Icoff="~/Pictures/Icons/off.png"
scripts_dir="$HOME/.scripts"
fconfig="$scripts_dir/.kb" 
id=$(xinput | grep "AT Translated" | sed 's/.*id=//' | cut -d " " -f 1 | grep -Po "\\d+")
if [ ! -f $fconfig ];
    then
        echo "Creating config file"
        echo "enabled" > $fconfig
        var="enabled"
    else
        read -r var< $fconfig
        echo "keyboard is : $var"
fi

if [ $var = "disabled" ];
    then
        notify-send -i $Icon "Enabling keyboard..." \ "ON - Keyboard connected !";
        echo "enable keyboard..."
        xinput enable $id
        echo "enabled" > $fconfig
    elif [ $var = "enabled" ]; then
        notify-send -i $Icoff "Disabling Keyboard" \ "OFF - Keyboard disconnected";
        echo "disable keyboard"
        xinput disable $id
        echo 'disabled' > $fconfig
fi
