# Installation

This repository is designed for a Void Linux machine running a Wayland session with MangoWM. The installer copies the reviewed configuration files and helper scripts; it does not install packages, enable services, or restart your session.

## 1. Install the software

Install the applications and utilities listed in [requirements.md](requirements.md) using Void's package manager or their upstream instructions. Confirm that MangoWM, Waybar, Rofi, Kitty, Fish, Starship, Matugen, PipeWire, `playerctld`, `swaybg`, CAVA, ImageMagick, `brightnessctl`, Python 3, and the Mango IPC utility are available as appropriate for your setup.

A Nerd Font is needed for the icon glyphs used by the bar and launcher. JetBrainsMono Nerd Font is the configured family.

## 2. Clone the repository

```sh
git clone https://github.com/calebmatau28-source/void-gruvbox.git
cd void-gruvbox
```

## 3. Review the plan

```sh
bash install.sh --dry-run
```

The dry run is the default if you run `bash install.sh` with no arguments. It prints the destinations that would be created or replaced and changes nothing. The installer reads the configuration files from `dotfiles/` when present, or safely extracts `dotfiles.tar.gz` into a temporary directory when using the GitHub repository bundle.

## 4. Install with backups

```sh
bash install.sh --apply
```

The installer asks before writing. Existing files are copied to:

```text
${XDG_STATE_HOME:-$HOME/.local/state}/void-gruvbox/backups/<timestamp>/
```

Scripts installed under `~/.local/bin/` receive executable permissions. The helper scripts use your home directory at runtime; the config files no longer contain the original machine-specific absolute home paths.

## 5. Validate before restarting

Check the Mango configuration without starting a new compositor:

```sh
mango -c ~/.config/mango/config.conf -p
```

Validate the Waybar JSON configuration:

```sh
python3 -m json.tool ~/.config/waybar/floating.jsonc >/dev/null
```

Check the wallpaper picker syntax:

```sh
bash -n ~/.local/bin/wallpaper-picker
```

Check the Fish configuration syntax:

```fish
fish -n ~/.config/fish/config.fish
```

If any validation command reports an error, do not restart Mango yet. Fix the reported issue first.

Then log out and back into the Mango session, or restart the relevant apps manually. The configuration starts Waybar and SwayNC through Mango's `exec_once` entries.

## Rollback

To restore the previous files from the most recent install:

```sh
bash install.sh --rollback
```

The rollback asks for confirmation. It restores backed-up files and removes files that did not exist before the installation. The backup directory is retained.

## Important machine-specific checks

- The wallpaper picker uses `~/Pictures/Wallpapers` unless `XDG_PICTURES_DIR` is set. It restores the last selected wallpaper, or selects the first image it finds if there is no saved selection.
- Waybar's backlight module auto-selects a display backlight. The brightness keybindings use `brightnessctl` auto-selection; systems with multiple backlight devices may need an explicit device name.
- The power menu requires a working `elogind`/`loginctl` setup and appropriate permissions.
- The Waybar media module is pinned to Spotify. Other MPRIS players may need a change to the `player` setting.
- The custom workspace status helper reads Mango's IPC output and displays the first monitor reported by Mango.
- Matugen's included templates currently preserve a fixed Gruvbox palette. The wallpaper picker triggers Matugen and reload hooks, but the palette is intentionally not dynamically sampled from each wallpaper yet.
- `fish/config.fish` includes optional abbreviations for `eza`, `lazygit`, and `fd`; install those tools separately or remove the corresponding abbreviations.
