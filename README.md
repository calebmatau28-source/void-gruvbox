# Void Gruvbox

A personal Void Linux desktop configuration built around **Mango Window Manager**, **Waybar**, and **Rofi**, with a muted Gruvbox-inspired palette and a slightly retro, beveled visual style.

> This repository is being organized from a working desktop setup. Configuration snapshots will be added after review so the published files are portable and do not contain machine-specific paths or private information.

## Desktop

| Component | Role |
|---|---|
| [Void Linux](https://voidlinux.org/) | Operating system |
| [MangoWM](https://github.com/DreamMaoMao/mangowm) | Wayland compositor / window manager |
| [Waybar](https://github.com/Alexays/Waybar) | Status bar |
| [Rofi](https://github.com/davatorium/rofi) | Application launcher and wallpaper menu |
| [Kitty](https://github.com/kovidgoyal/kitty) | Terminal |
| Fish | Interactive shell |
| Starship | Shell prompt |
| Matugen | Wallpaper-derived color generation |
| SwayNC | Notification center |
| PipeWire / WirePlumber | Audio |
| swaybg | Wallpaper display |
| CAVA | Terminal audio visualizer |

Spotify is used as an optional MPRIS media source.

## Design

- Gruvbox-inspired dark colors, with muted green and warm yellow/orange accents.
- Compact Waybar with workspace controls, media information, system utilities, connectivity, audio, brightness, battery, notifications, power, and clock modules.
- Rofi application launcher styled to match the desktop.
- Wallpaper selection intended to update the desktop palette through Matugen.
- Keyboard-driven Mango workspace and window management.

## Repository layout

The repository will contain reviewed, portable configuration snapshots and documentation. Machine-specific paths, caches, generated thumbnails, downloaded wallpaper collections, and secrets do not belong here.

Planned areas:

- `mango/` — MangoWM configuration
- `waybar/` — Waybar JSONC and CSS
- `rofi/` — Rofi launcher and theme files
- `matugen/` — Matugen templates
- `fish/` — Fish shell configuration
- `cava/` — CAVA configuration
- `scripts/` — desktop helper scripts
- `docs/` — setup notes and keybindings

## Setup

This project targets Void Linux and the Wayland session described above. It is not yet an installable dotfiles bundle: configuration files and a safe installation/backup procedure will be added after the current setup has been reviewed and sanitized.

See [Requirements](docs/requirements.md) and [Keybindings](docs/keybindings.md).

## Wallpapers and third-party assets

Wallpaper collections are not bundled. Some external artwork used during setup has its own license and attribution requirements; keep those notices with any assets you redistribute.

## Contributing

This is primarily a personal desktop configuration. Suggestions and issue reports are welcome, especially for portability, documentation, and compatibility.

## License

A repository license has not been selected yet. Until one is added, do not assume these configuration files are licensed for redistribution.
