if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_color_autosuggestion yellow
    #!/bin/bash    
    ~/.config/neofetch/run_neofetch.sh
    zoxide init fish | source
end
