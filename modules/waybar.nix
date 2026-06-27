{ config, pkgs, ... }:

{
  environment.etc."xdg/waybar/config" = {
    text = ''
{
    "height": 25, // Waybar height (to be removed for auto height)
    "spacing": 4, // Gaps between modules (4px)
    "modules-left": [
        "sway/workspaces",
        "sway/mode",
    ],
    "modules-center": [
        "sway/window"
    ],
    "modules-right": [
        "pulseaudio",
        "network",
        "power-profiles-daemon",
        "battery",
        "clock",
        "tray",
    ],
    "sway/mode": {
        "format": "<span style=\"italic\">{}</span>"
    },
    "tray": {
        // "icon-size": 21,
        "spacing": 10,
        // "icons": {
        //   "blueman": "bluetooth",
        //   "TelegramDesktop": "$HOME/.local/share/icons/hicolor/16x16/apps/telegram.png"
        // }
    },
    "clock": {
        // "timezone": "America/New_York",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format-alt": "{:%Y-%m-%d}"
    },
    "battery": {
        "states": {
            // "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{capacity}% {icon}",
        "format-full": "{capacity}% {icon}",
        "format-charging": "{capacity}% 󰃨",
        "format-plugged": "{capacity}% ",
        "format-alt": "{time} {icon}",
        // "format-good": "", // An empty format will hide the module
        // "format-full": "",
        "format-icons": ["", "", "", "", ""]
    },
    "power-profiles-daemon": {
      "format": "{icon}",
      "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
      "tooltip": true,
      "format-icons": {
        "default": "",
        "performance": "",
        "balanced": "",
        "power-saver": ""
      }
    },
    "network": {
        // "interface": "wlp2*", // (Optional) To force the use of this interface
        "format-wifi": "{essid} ({signalStrength}%) ",
        "format-ethernet": "{ipaddr}/{cidr} 󰊗",
        "tooltip-format": "{ifname} via {gwaddr} 󰊗",
        "format-linked": "{ifname} (No IP) 󰊗",
        "format-disconnected": "Disconnected ⚠",
        "format-alt": "{ifname}: {ipaddr}/{cidr}"
    },
    "pulseaudio": {
        // "scroll-step": 1, // %, can be a float
        "format": "{volume}% {icon} {format_source}",
        "format-bluetooth": "{volume}% {icon} {format_source}",
        "format-bluetooth-muted": "󰅶 {icon} {format_source}",
        "format-muted": "󰅶 {format_source}",
        "format-source": "{volume}% ",
        "format-source-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "󰂑",
            "headset": "󰂑",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "on-click": "pavucontrol"
    },
}
    '';
    mode = "0644";
  };
}
