set quiet := true

biome_bin := env("HOME") / ".local/share/nvim/mason/bin/biome"

#───────────────────────────────────────────────────────────────────────────────

# uses personal vaults from in `~/.config/perma-repos.csv`, and custom Obsidian URI
personal-build-and-reload:
    #!/usr/bin/env zsh
    # 1. BUILD
    # Due to globbing, the source files are inserted in alphabetical order.
    # To keep things predictable, they are simply numbered in the order they
    # should be included in.
    cat ./source/**/*.css <(echo ; echo "/* @settings") ./source/style-settings.yaml <(echo "*/") \
        > /tmp/theme.css

    # 2. RELOAD
    cut -d, -f1 "$HOME/.config/perma-repos.csv" |
        sed "s|^~|$HOME|" |
        xargs -I {} find {} -maxdepth 1 -name ".obsidian" | # only vaults
        xargs dirname |                                     # vault root
        xargs -I {} cp -f "/tmp/theme.css" "{}/.obsidian/themes/Shimmering Focus/theme.css"
    rm -f /tmp/theme.css
    open -a "Obsidian"

biome-check-and-format:
    {{ biome_bin }} check --write --error-on-warnings --log-kind="compact"
