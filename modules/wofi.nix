{ config, pkgs, ... }:

{
  environment.etc."wofi/config" = {
    text = ''
# Display mode: drun (desktop applications) and run (system executables)
mode=drun

# Position and size parameters
width=40%
height=50%
location=center

# Search behavior
insensitive=true
prompt=Search Apps...
hide_scroll=true

# Miscellaneous options
allow_images=true
term=foot
close_on_focus_loss=true
    '';
    mode = "0644";
  };

  environment.etc."wofi/style.css" = {
    text = ''
/* Container for the entire window */
window {
    font-family: "0xProto Nerd Font", sans-serif;
    font-size: 14px;
    background-color: #3F4045;
    color: #ffffff;
    border: 5px solid #171219;
}

/* The search bar field */
#input {
    margin: 10px;
    padding: 8px;
    border: none;
    border-radius: 4px;
    background-color: #313244;
    color: #cdd6f4;
}

/* The scrolling container wrapping list items */
#scroll {
    margin: 5px 10px 10px 10px;
}

/* Individual application/command listings */
#entry {
    padding: 6px;
    border-radius: 4px;
}

/* Active or keyboard-selected entry highlight */
#entry:selected {
    background-color: #89b4fa;
    color: #11111b;
}

/* Text elements inside an entry listing */
#text {
    margin-left: 10px;
}
    '';
    mode = "0644";
  };
}
