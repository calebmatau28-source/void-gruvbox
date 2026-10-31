#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODE="${1:---dry-run}"
STATE_ROOT="${XDG_STATE_HOME:-$HOME/.local/state}/void-gruvbox"
BACKUPS_ROOT="$STATE_ROOT/backups"
MANIFEST="$STATE_ROOT/last-install.tsv"

FILES=(
  .config/mango/config.conf
  .config/waybar/floating.jsonc
  .config/waybar/floating.css
  .config/waybar/colors.css
  .config/rofi/config.rasi
  .config/rofi/themes/void.rasi
  .config/rofi/themes/wallpaper-picker.rasi
  .config/rofi/themes/matugen.rasi
  .config/matugen/config.toml
  .config/matugen/templates/waybar.css
  .config/matugen/templates/rofi.rasi
  .config/matugen/templates/kitty.conf
  .config/cava/config
  .config/fish/config.fish
  .config/starship.toml
  .config/kitty/kitty.conf
  .config/kitty/matugen.conf
  .local/bin/wallpaper-picker
  .local/bin/mango-tag
  .local/bin/waybar-power-menu
)

usage() {
  cat <<'USAGE'
Void Gruvbox dotfiles installer

Usage:
  bash install.sh                 Show a dry-run (default)
  bash install.sh --dry-run       Show planned changes without writing
  bash install.sh --apply         Back up existing files, then install
  bash install.sh --rollback      Restore files from the last install backup

The installer does not install packages, enable services, or restart your session.
USAGE
}

safe_relpath() {
  case "$1" in
    /*|../*|*/../*|*/..|..|"") return 1 ;;
    *) return 0 ;;
  esac
}

rollback_manifest() {
  local manifest_file="$1" backup_dir="$2"
  local action rel destination saved
  [[ -f "$manifest_file" ]] || return 0
  while IFS=$'\t' read -r action rel; do
    [[ -n "${rel:-}" ]] || continue
    if ! safe_relpath "$rel"; then
      printf 'Skipping unsafe manifest path: %s\n' "$rel" >&2
      continue
    fi
    destination="$HOME/$rel"
    case "$action" in
      backed-up)
        saved="$backup_dir/$rel"
        if [[ -e "$saved" || -L "$saved" ]]; then
          mkdir -p -- "$(dirname -- "$destination")"
          if [[ -d "$destination" && ! -L "$destination" ]]; then
            printf 'Cannot restore over directory: %s\n' "$destination" >&2
            return 1
          fi
          rm -f -- "$destination"
          cp -a -- "$saved" "$destination"
          printf 'Restored %s\n' "$rel"
        else
          printf 'Missing backup for %s\n' "$rel" >&2
          return 1
        fi
        ;;
      new)
        if [[ -f "$destination" || -L "$destination" ]]; then
          rm -f -- "$destination"
          printf 'Removed %s\n' "$rel"
        fi
        ;;
      *)
        printf 'Unknown manifest action for %s\n' "$rel" >&2
        return 1
        ;;
    esac
  done < "$manifest_file"
}

case "$MODE" in
  --help|-h)
    usage
    exit 0
    ;;
  --dry-run)
    ;;
  --apply)
    ;;
  --rollback)
    if [[ ! -f "$MANIFEST" ]]; then
      printf 'No previous install manifest found at %s\n' "$MANIFEST" >&2
      exit 1
    fi
    backup_dir="$(<"$MANIFEST")"
    if [[ ! -d "$backup_dir" ]]; then
      printf 'Backup directory is missing: %s\n' "$backup_dir" >&2
      exit 1
    fi
    printf 'This will restore the files saved by the most recent installation.\n'
    read -r -p 'Continue? [y/N] ' answer
    [[ "$answer" == [yY] || "$answer" == [yY][eE][sS] ]] || exit 0
    rollback_manifest "$MANIFEST.entries" "$backup_dir"
    mv -- "$MANIFEST" "$MANIFEST.rolled-back"
    rm -f -- "$MANIFEST.entries"
    printf 'Rollback complete. Backups were kept in %s\n' "$backup_dir"
    exit 0
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac

# Validate every source before showing or applying any changes.
for rel in "${FILES[@]}"; do
  if ! safe_relpath "$rel" || [[ ! -f "$ROOT/dotfiles/$rel" ]]; then
    printf 'Missing or unsafe source file: %s\n' "$rel" >&2
    exit 1
  fi
done

printf 'Target home: %s\n' "$HOME"
printf 'Files to install: %d\n' "${#FILES[@]}"
printf '\n'
for rel in "${FILES[@]}"; do
  destination="$HOME/$rel"
  if [[ -e "$destination" || -L "$destination" ]]; then
    printf 'BACK UP + REPLACE  %s\n' "$rel"
  else
    printf 'CREATE             %s\n' "$rel"
  fi
done

if [[ "$MODE" == --dry-run ]]; then
  printf '\nDry run only. No files were changed. Run: bash install.sh --apply\n'
  exit 0
fi

printf '\nExisting files will be backed up under %s.\n' "$BACKUPS_ROOT"
read -r -p 'Proceed with installation? [y/N] ' answer
[[ "$answer" == [yY] || "$answer" == [yY][eE][sS] ]] || exit 0

stamp="$(date +%Y%m%d-%H%M%S)"
backup_dir="$BACKUPS_ROOT/$stamp"
mkdir -p -- "$backup_dir" "$STATE_ROOT"
: > "$MANIFEST.entries"
printf '%s\n' "$backup_dir" > "$MANIFEST"

for rel in "${FILES[@]}"; do
  source_file="$ROOT/dotfiles/$rel"
  destination="$HOME/$rel"
  mkdir -p -- "$(dirname -- "$destination")"

  if [[ -d "$destination" && ! -L "$destination" ]]; then
    printf 'Refusing to replace a directory: %s\n' "$destination" >&2
    exit 1
  fi

  if [[ -e "$destination" || -L "$destination" ]]; then
    saved="$backup_dir/$rel"
    mkdir -p -- "$(dirname -- "$saved")"
    cp -a -- "$destination" "$saved"
    printf 'backed-up\t%s\n' "$rel" >> "$MANIFEST.entries"
    rm -f -- "$destination"
  else
    printf 'new\t%s\n' "$rel" >> "$MANIFEST.entries"
  fi

  mode=0644
  case "$rel" in
    .local/bin/*) mode=0755 ;;
  esac
  install -D -m "$mode" -- "$source_file" "$destination"
  printf 'Installed %s\n' "$rel"
done

printf '\nInstallation complete. Backup: %s\n' "$backup_dir"
printf 'To undo this install later, run: bash install.sh --rollback\n'
printf 'Log out and back in (or restart the relevant applications) to load the new settings.\n'
