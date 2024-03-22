read_theme() {
    theme_file="$HOME/.config/hypr/theme.txt"
    if [ -f "$theme_file" ]; then
        theme=$(<"$theme_file")
        echo "$theme"
    else
        echo "Errore: Il file del tema non esiste o non è accessibile."
        exit 1
    fi
}

theme=$(read_theme)
waybar_path="$HOME/.config/waybar/$theme"
waybar --config "$waybar_path/config2.jsonc" --style "$waybar_path/style2.css"
