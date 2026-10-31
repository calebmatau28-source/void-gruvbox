# Requirements

## Base system

- Void Linux
- A working Wayland session
- MangoWM (the setup was reported on version 0.18.4)

## Desktop applications and services

| Component | Purpose |
|---|---|
| Waybar | Status bar (setup reported on version 0.15) |
| Rofi | Application launcher and wallpaper picker (setup reported on version 2.0.0) |
| Kitty | Terminal emulator |
| Fish | Shell |
| Starship | Prompt |
| Matugen | Generate theme colors from a wallpaper |
| SwayNC | Notifications |
| PipeWire and WirePlumber | Audio routing |
| playerctl / playerctld | MPRIS media controls |
| swaybg | Wallpaper display |
| CAVA | Audio visualizer |
| ImageMagick | Wallpaper thumbnail generation |
| brightnessctl | Backlight controls |

A Nerd Font is recommended for icon glyphs in Waybar and Rofi. The exact font family should be documented after checking the current system configuration.

## Optional integrations

- Spotify, installed separately, for the Waybar MPRIS module.
- Bluetooth applet and NetworkManager applet, if enabled in the session.
- btop, launched from the Waybar system-monitor module.
- A wallpaper collection stored outside this repository.

## Portability

Before installing the dotfiles on another machine:

1. Install the required applications using the package manager appropriate to that system.
2. Review the configuration files and adjust hardware-specific settings.
3. Back up existing configuration directories.
4. Apply the files selectively; do not blindly overwrite an existing desktop setup.
5. Start the Wayland session and verify each component.

The final install instructions will be completed after the configuration files and scripts have been reviewed.
