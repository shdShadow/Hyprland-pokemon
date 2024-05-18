#!/bin/bash

# Leggi il contenuto del file
theme=$(cat ~/.config/hypr/theme.txt)

# Controlla se il tema è "Umbreon"
if [ "$theme" = "Umbreon" ]; then
    # Esegui il comando neofetch con le opzioni specificate
    neofetch --kitty ~/NeofetchImages/Umbreon.png --size 300 --yoffset 2 --xoffset 5 --gap 10
fi

