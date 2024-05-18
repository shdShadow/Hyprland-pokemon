#!/bin/bash

# Funzione per leggere il tema dal file
read_theme() {
    theme_file="$HOME/.config/hypr/theme.txt"
    if [ -f "$theme_file" ]; then
        theme=$(<"$theme_file")
        echo "$theme"
    else
        echo "Error: the theme file might be corrupted or can't be accessed"
        exit 1
    fi
}

# Funzione principale
kitty_exec() {
    # Leggi il tema dal file
    theme=$(read_theme)
    
    # Costruisci il percorso del file di configurazione di Kitty
    kitty_config_path="$HOME/.config/kitty/$theme.conf"

    # Esegui il comando kitty
    kitty --config "$kitty_config_path" &
}

rofi_exec(){
    theme=$(read_theme)
    rofi_path="$HOME/.config/rofi/launchers/$theme/launcher.sh"
    if [ -x "$rofi_path" ]; then  # Check if the file is executable
        "$rofi_path"
    else
        echo "Error: The file $rofi_path is not executable or does not exist."
    fi
}
powermenu_exec(){
    theme=$(read_theme)
    powermenu_path="$HOME/.config/rofi/powermenu/$theme/powermenu.sh"
    if [ -x "$powermenu_path" ]; then  # Check if the file is executable
        "$powermenu_path"
    else
        echo "Error: The file $powermenu_path is not executable or does not exist."
    fi
}

wifi_exec(){
    theme=$(read_theme)
    wifi_path="$HOME/.config/rofi/wifi/$theme/wifi.sh"
    if [ -x "$wifi_path" ]; then  # Check if the file is executable
        "$wifi_path"
    else
        echo "Error: The file $wifi_path is not executable or does not exist."
    fi
}
# Controllo degli argomenti
if [ "$1" = "--kitty" ]; then
    kitty_exec
fi

if [ "$1" = "--rofi" ]; then
    rofi_exec
fi

if [ "$1" = "--powermenu" ]; then
    powermenu_exec
fi

if [ "$1" = "--wifi" ]; then
    wifi_exec
fi

