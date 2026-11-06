function wall --description 'Change wallpaper by filename or path'
    if test (count $argv) -ne 1
        echo "Usage: wall <filename-or-path>"
        return 2
    end
    
    set -l wallpaper $argv[1]
    
    # Search the wallpaper folder if the supplied path doesn't exist
        if not test -f "$wallpaper"
                set -l found (find "$HOME/Pictures/Wallpapers" -type f -iname "$argv[1]" -print -quit 2>/dev/null)
                if test -n "$found"
                        set wallpaper "$found"
                end
        end
    
        if not test -f "$wallpaper"
                echo "Wallpaper not found: $argv[1]"
                return 1
        end
    
        # Update generated colors
        if command -q matugen
                matugen image "$wallpaper" -m dark; or return 1
        end
    
        # Apply wallpaper
        pkill -x swaybg 2>/dev/null
        nohup swaybg -i "$wallpaper" -m fill >/dev/null 2>&1 &
    
        echo "Wallpaper changed: $wallpaper"
end
