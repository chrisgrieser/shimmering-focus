set quiet := true

# disable this if you are forking the theme
personal_settings := "true"

#───────────────────────────────────────────────────────────────────────────────

build-and-reload-vaults:
    #!/usr/bin/env zsh
    # BUILD
    # Due to globbing, the source files are inserted in alphabetical order.
    # To keep things predictable, they are simply number in the order they
    # should be included in.
    cat ./source/**/*.css <(echo ; echo "/* @settings") ./source/style-settings.yaml <(echo "*/") \
        > /tmp/theme.css

    # PUSH TO LOCAL VAULTS
    # uses personal vaults saved in `~/.config/perma-repos.csv`
    if [[ "{{ personal_settings }}" == "true" ]]; then
        cut -d, -f2 "$HOME/.config/perma-repos.csv" |
            sed "s|^~|$HOME|" |
            xargs -I {} find {} -maxdepth 1 -name ".obsidian" | # only vaults
            xargs dirname |                                     # vault root
            xargs -I {} cp -f "/tmp/theme.css" "{}/.obsidian/themes/Shimmering Focus/theme.css"
        rm -f /tmp/theme.css
        open -a "Obsidian" # macOS specific opener
    fi

format-all-css:
    #!/usr/bin/env zsh
    # requires personal biome location
    [[ "{{ personal_settings }}" != "true" ]] && return 0
    $HOME/.local/share/nvim/mason/bin/biome check --write --error-on-warnings --log-kind="compact"
