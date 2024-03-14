import os
import random

def read_theme():
    theme_file = os.path.expanduser("~/.config/hypr/theme.txt")
    if os.path.isfile(theme_file):
        with open(theme_file, "r") as file:
            theme = file.read().strip()
            return theme
    else:
        print("Error: The theme file does not exist or is not accessible.")
        exit(1)

def hyprpaper_shuffle():
    theme = read_theme()
    wallpapers_dir = "Wallpapers"
    full_path = os.path.join(os.path.expanduser("~"), wallpapers_dir, theme)
    screen_name = "eDP-1"
    print(full_path)
    
    directory_contents = os.listdir(full_path)
    random_element = random.choice(directory_contents)
    random_element_full_path = os.path.join(full_path, random_element)

    os.system(f"hyprctl hyprpaper preload {random_element_full_path}")
    os.system(f"hyprctl hyprpaper wallpaper {screen_name},{random_element_full_path}")

if __name__ == "__main__":
    hyprpaper_shuffle()

