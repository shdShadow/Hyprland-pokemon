#!/usr/bin/env python3

import gi
gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
import json

# Crea un nuovo player
player = Playerctl.Player()

# Controlla se il player è in riproduzione
if player.props.status != 'Playing':
    print(json.dumps({"text": "Nothing playing", "class": "custom-progress"}))
    exit(0)

# Ottieni la durata totale della canzone in microsecondi e convertila in secondi
total_duration = player.props.metadata['mpris:length'] // 1000000

# Ottieni il tempo di riproduzione corrente della canzone in secondi
current_position = player.get_position() // 1000000

# Converti il tempo corrente in formato mm:ss
current_time = "{:02d}:{:02d}".format(current_position // 60, current_position % 60)

# Lunghezza totale della barra di avanzamento
bar_length = 20

# Calcolare la posizione relativa del pallino sulla barra
relative_position = current_position * bar_length // total_duration

# Costruire la stringa completa
full_text = current_time + " |"
for i in range(bar_length):
    if i == relative_position:
        full_text += "󰐝"  # Simbolo del pallino
    else:
        full_text += "󰍴"
full_text += "|{:02d}:{:02d}".format(total_duration // 60, total_duration % 60)

# Restituisci l'output come un oggetto JSON
print(json.dumps({"text": full_text, "class": "custom-progress"}))