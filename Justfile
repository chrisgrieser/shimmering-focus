set quiet := true

# INFO uses personal vaults saved in `~/.config/perma-repos.csv`
build_and_push_to_local_vaults:
    #!/usr/bin/env zsh
    # BUILD
    # Due to globbing, the source files are inserted in alphabetical order.
    # To keep things predictable, they are simply number in the order they
    # should be included in.
    cat ./source/*.css <(echo ; echo "/* @settings") ./source/style-settings.yaml <(echo "*/") \
        > /tmp/theme.css

    # PUSH TO LOCAL VAULTS
    cut -d, -f2 "$HOME/.config/perma-repos.csv" |
        sed "s|^~|$HOME|" |
        xargs -I {} find {} -maxdepth 1 -name ".obsidian" | # only vaults
        xargs dirname |                                     # vault root
        xargs -I {} cp -f "/tmp/theme.css" "{}/.obsidian/themes/Shimmering Focus/theme.css"
    rm -f /tmp/theme.css

    # OPEN OBSIDIAN
    open -a "Obsidian" # macOS specific opener
