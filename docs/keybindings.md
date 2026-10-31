# MangoWM keybindings

These bindings are read from the uploaded `config.conf` after replacing the original machine-specific paths. The wallpaper shortcut uses the keyboard event reported by the source machine: its physical F9 key emits `XF86AudioNext`.

## Launcher and session

| Binding | Action |
|---|---|
| `Alt + Space` | Open Rofi application launcher |
| `Alt + Enter` | Open Kitty |
| `Super + R` | Reload Mango configuration |
| `Super + M` | Quit MangoWM |
| `Alt + Q` | Close focused client |
| `Super + Escape` or `Alt + Backslash` | Toggle floating state |
| `Super + XF86AudioNext` | Open wallpaper picker |

## Focus and window management

| Binding | Action |
|---|---|
| `Super + Tab` | Focus next window in stack |
| `Alt + Arrow keys` | Focus in the selected direction |
| `Super + Shift + Arrow keys` | Move focused client in the selected direction |
| `Alt + A` | Toggle maximize |
| `Alt + F` | Toggle fullscreen |
| `Alt + Shift + F` | Toggle fake fullscreen |
| `Super + I` | Minimize focused client |
| `Super + Shift + I` | Restore minimized client |
| `Super + O` | Toggle overlay |
| `Alt + Z` | Toggle scratchpad |
| `Super + N` | Switch layout |
| `Alt + E` | Set scroller proportion to 1.0 |
| `Alt + X` | Cycle scroller proportion presets |

## Tags and monitors

| Binding | Action |
|---|---|
| `Ctrl + 1–4` | View tag 1–4 |
| `Alt + 1–4` | Move focused client to tag 1–4 |
| `Super + Left / Right` | View adjacent tag |
| `Ctrl + Left / Right` | View adjacent tag that has a client |
| `Ctrl + Super + Left / Right` | Move focused client to adjacent tag |
| `Alt + Shift + Left / Right` | Focus adjacent monitor |
| `Super + Alt + Left / Right` | Move focused client to adjacent monitor |

## Gaps, move, and resize

| Binding | Action |
|---|---|
| `Alt + Shift + X` | Increase gaps |
| `Alt + Shift + Z` | Decrease gaps |
| `Alt + Shift + R` | Toggle gaps |
| `Ctrl + Shift + Arrow keys` | Move window in 50-pixel increments |
| `Ctrl + Alt + Arrow keys` | Resize window in 50-pixel increments |

## Mouse

| Binding | Action |
|---|---|
| `Super + Left mouse drag` | Move floating window |
| `Super + Right mouse drag` | Resize floating window |
| Middle mouse button | Toggle maximize |

## Media and hardware keys

- Volume up/down: adjust default PipeWire sink by 5%.
- Mute: toggle default PipeWire sink mute.
- Brightness up/down: adjust the selected backlight by 2%.

Hardware key behavior can vary between keyboards. Use `wev` to inspect the key event if one of these bindings does not trigger.
