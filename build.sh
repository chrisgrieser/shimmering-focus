# WHAT THIS SCRIPT DOES
# - Check the yaml from the Style Settings for errors. If there are any, the
#   build is aborted, the errors are passed (e.g. for a notification) and the
#   Style Settings tab is opened.
# - bumps version number in css file
# - updates download counts in badges of the .md files
# - updates the stylelint-file
# - git add, commit, pull, and push to the remote repo

#───────────────────────────────────────────────────────────────────────────────

# CONFIG
script_dir="$(dirname "$(readlink -f "$0")")"
CSS_PATH="$script_dir/theme.css"

#───────────────────────────────────────────────────────────────────────────────

# YAML VALIDATION
# - Abort build if yaml invalid
# - requires style settings placed at the very bottom of the theme css
npm_location="$(npm root)/.bin/"
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$npm_location:$PATH
if ! command -v yaml-validator &>/dev/null; then echo "yaml-validator not installed." && return 1; fi

sed -n '/@settings/,$p' "$CSS_PATH" | sed '1d;$d' | sed '$d' >temp.yml
YAMLLINT_OUTPUT=$(yamllint-validator temp.yml)
if [[ $? == 1 ]]; then
	echo "YAML ERROR"
	echo "$YAMLLINT_OUTPUT" | sed '1d'
	return 1
fi
rm temp.yml

#───────────────────────────────────────────────────────────────────────────────

# Bump version number
versionLine=$(grep -Ewn "^Version" "$CSS_PATH" | cut -d: -f1 | head -n1)
currentVersion=$(sed -n "${versionLine}p" "$CSS_PATH" | cut -d. -f2)
nextVersion=$((currentVersion + 1))
manifest="$(dirname "$CSS_PATH")/manifest.json"
sed -E -i '' "${versionLine}s/(.*\.)[[:digit:]]+/\1$nextVersion/" "$CSS_PATH"
sed -E -i '' "s/(\"version\": \".*\.).*/\1$nextVersion\",/" "$manifest"

#───────────────────────────────────────────────────────────────────────────────

# Copy for documentation purposes
cp "$HOME/.config/_linter-configs/stylelintrc.yml" ./.stylelintrc.yml

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" | grep -oe '"Shimmering Focus","download":[[:digit:]]*' | cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" ./README.md

#───────────────────────────────────────────────────────────────────────────────

# git add, commit, pull, and push
# needs piping stderr to stdin, since git push reports an error even on success
git add --all && git commit -m "publish (automated)"
git pull && git push 2>&1

#───────────────────────────────────────────────────────────────────────────────
#───────────────────────────────────────────────────────────────────────────────
# INFO specific to my setup

if [[ "$OSTYPE" =~ "darwin" ]]; then
	cd "$VAULT_PATH/.obsidian/themes/Shimmering Focus/" || return 1

	# confirmation sound
	afplay "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/siri/jbl_confirm.caf" & # codespell-ignore

	cp "$CSS_PATH" "fallback.css"     # copy theme file for fallback
	ln -sf "fallback.css" "theme.css" # re-create symlink
	rm -rf "$script_dir"              # delete this repo folder
fi
