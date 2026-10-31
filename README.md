# Void Gruvbox

A personal Void Linux desktop configuration built around **Mango Window Manager**, **Waybar**, and **Rofi**, with a dark Gruvbox-inspired palette and a slightly retro, beveled visual style.

## Desktop stack

| Component | Role |
|---|---|
| [Void Linux](https://voidlinux.org/) | Operating system |
| [MangoWM](https://github.com/mangowm/mango) | Wayland compositor / window manager |
| [Waybar](https://github.com/Alexays/Waybar) | Status bar |
| [Rofi](https://github.com/davatorium/rofi) | Application launcher and wallpaper menu |
| [Kitty](https://github.com/kovidgoyal/kitty) | Terminal |
| Fish + Starship | Shell and prompt |
| Matugen | Theme template generation and reload hooks |
| SwayNC | Notification center |
| PipeWire / WirePlumber | Audio |
| swaybg | Wallpaper display |
| CAVA | Terminal audio visualizer |

Spotify is an optional MPRIS media source.

## Design

- Dark Gruvbox-inspired colors with muted green, warm yellow, and orange accents.
- Compact Waybar with launcher and four custom workspace indicators on the left, media information in the center, and system controls on the right.
- Rofi application launcher and two-column wallpaper picker styled to match the desktop.
- Raised/beveled Waybar modules and a recessed media display for a slightly retro desktop feel.
- Wallpaper picker with thumbnail caching, recursive image discovery, and Matugen reload hooks.

## Repository layout

- `dotfiles/` — reviewed configuration files and helper scripts, arranged by their destination under `$HOME`.
- `docs/requirements.md` — software and font requirements.
- `docs/keybindings.md` — MangoWM keyboard and mouse bindings.
- `docs/installation.md` — installation, validation, and rollback instructions.
- `install.sh` — backup-first installer with dry-run and rollback modes.

## Install

```sh
git clone https://github.com/calebmatau28-source/void-gruvbox.git
cd void-gruvbox
bash install.sh --dry-run
bash install.sh --apply
```

The installer asks before writing, backs up every replaced file to `${XDG_STATE_HOME:-$HOME/.local/state}/void-gruvbox/backups/`, and installs helper scripts with executable permissions. To undo the most recent install:

```sh
bash install.sh --rollback
```

It does not install packages, enable services, or restart your session. Read [the full installation guide](docs/installation.md) before applying it.

## Portability notes

The original machine-specific absolute home paths have been removed. Hardware and optional integrations still vary: backlight selection, monitor topology, Spotify, btop, pavucontrol, and elogind should be checked on the target system. The included Matugen templates currently preserve a fixed Gruvbox palette rather than dynamically sampling every color from the selected wallpaper.

## Wallpapers and third-party assets

Wallpaper collections are not bundled. External artwork retains its own license and attribution requirements; include those notices with any artwork you redistribute.

## License

No repository license has been selected yet. Until one is added, do not assume these configuration files are licensed for redistribution.
