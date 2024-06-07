#!/usr/bin/env zsh

# merge files
cat ./header-and-fonts.css ./main.css <(echo "/* @settings") ./style-settings.yaml <(echo "*/") \
	> ../theme.css

# push build to my vaults
cut -d, -f2 "$HOME/.config/perma-repos.csv" |
	sed "s|^~|$HOME|" |
	xargs -I {} find {} -maxdepth 1 -name ".obsidian" | # only vaults
	xargs dirname |                                     # vault root
	xargs -I {} cp -f "../theme.css" "{}/.obsidian/themes/Shimmering Focus/theme.css"

# open Obsidian (if not publishing)
if [[ "$1" != "publish" ]]; then open -a "Obsidian"; fi
