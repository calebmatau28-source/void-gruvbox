# Requirements

## Base system

- Void Linux
- A working Wayland session
- MangoWM (the source configuration was collected from MangoWM 0.18.4)

## Desktop components

| Component | Purpose |
|---|---|
| Waybar | Status bar (source setup used 0.15) |
| Rofi | Application launcher and wallpaper picker (source setup used 2.0.0) |
| Kitty | Terminal emulator |
| Fish | Interactive shell |
| Starship | Shell prompt |
| Matugen | Theme template generation and application reload hooks |
| SwayNC | Notification center |
| PipeWire / WirePlumber | Audio routing |
| playerctl / playerctld | MPRIS media status |
| swaybg | Wallpaper display |
| CAVA | Terminal audio visualizer |
| ImageMagick (`magick`) | Wallpaper thumbnails |
| brightnessctl | Hardware brightness control |
| Python 3 | Mango workspace status helper |
| Mango IPC utility (`mmsg`) | Workspace state and click actions |
| elogind (`loginctl`) | Power menu actions |

## Fonts

- JetBrainsMono Nerd Font (the configured terminal, bar, and launcher font family)

## Optional integrations

- Spotify for the configured Waybar MPRIS module.
- `btop` for the Waybar system-monitor launcher.
- `pavucontrol` for the Waybar audio click action.
- `eza`, `lazygit`, and `fd` for Fish abbreviations and FZF file search.
- A wallpaper collection in `~/Pictures/Wallpapers` (not bundled in this repository).

## Notes

The configuration was collected from one laptop. Backlight hardware, installed font family, monitor layout, session services, and optional applications vary by machine. See [installation.md](installation.md) for the install and validation procedure.
