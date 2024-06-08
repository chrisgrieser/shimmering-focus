set quiet := true

#───────────────────────────────────────────────────────────────────────────────

_build:
    #!/usr/bin/env zsh
    # Due to globbing, the source files are inserted in alphabetical order.
    # To keep things predictable, they are simply number in the order they
    # should be included in.
    cat ./source/*.css <(echo "/* @settings") ./source/style-settings.yaml <(echo "*/") \
        > ./theme.css

# uses personal vaults saved in `~/.config/perma-repos.csv`
_push-to-local-vaults:
    #!/usr/bin/env zsh
    cut -d, -f2 "$HOME/.config/perma-repos.csv" |
        sed "s|^~|$HOME|" |
        xargs -I {} find {} -maxdepth 1 -name ".obsidian" | # only vaults
        xargs dirname |                                     # vault root
        xargs -I {} cp -f "./theme.css" "{}/.obsidian/themes/Shimmering Focus/theme.css"

#──────────────────────────────────────────────────────────────────────────────

build-and-reload: && _build _push-to-local-vaults
    open -a "Obsidian"

theme_header := "./source/00 header.css"

bump-version-and-changelog: && _build _push-to-local-vaults
    zsh ./bump-version-and-changelog.sh "{{ theme_header }}"

only-build: _build
