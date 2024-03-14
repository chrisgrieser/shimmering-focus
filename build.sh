# WHAT THIS SCRIPT DOES
# - Check the yaml from the Style Settings for errors. If there are any, the
#   build is aborted, the errors are passed (e.g. for a notification) and the
#   Style Settings tab is opened.
# - bumps version number in css file and manifest
# - updates download counts in badges of the README files
# - copies the stylelint-config for documentation
# - update changelog
# - git add, commit, pull, and push to the remote repo

#───────────────────────────────────────────────────────────────────────────────
# CONFIG

script_dir="$(dirname "$(readlink -f "$0")")"
CSS_PATH="$script_dir/theme.css"

#───────────────────────────────────────────────────────────────────────────────
# TEST: YAML VALIDATION

# - Abort build if yaml invalid
# - requires style-settings placed at the very bottom of the theme's css
npm_location="$(npm root)/.bin/"
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$npm_location:$PATH
if ! command -v yaml-validator &>/dev/null; then echo "yaml-validator not installed." && return 1; fi

sed -n '/@settings/,$p' "$CSS_PATH" | sed '1d;$d' | sed '$d' >temp.yml
YAMLLINT_OUTPUT=$(yaml-validator temp.yml)
if [[ $? == 1 ]]; then
	echo "YAML ERROR"
	echo "$YAMLLINT_OUTPUT" | sed '1d'
	return 1
fi
rm temp.yml

#───────────────────────────────────────────────────────────────────────────────
# BUMP VERSION NUMBER

versionLine=$(grep --line-number --max-count=1 "^Version" "theme.css")
versionLnum=$(echo "$versionLine" | cut -d: -f1)

currentVer=$(echo "$versionLine" | cut -d. -f2)
nextVer=$((currentVer + 1))

manifest="$(dirname "$CSS_PATH")/manifest.json"
sed -E -i '' "${versionLnum} s/$currentVer/$nextVer/" "$CSS_PATH"
sed -E -i '' "/version/ s/$currentVer/$nextVer/" "$manifest"

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" |
	grep -oe '"Shimmering Focus","download":[[:digit:]]*' |
	cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" ./README.md

#───────────────────────────────────────────────────────────────────────────────
# CHANGELOG
commits_since_last_publish=$(git log :/publish.. --format="- %cs %s")

echo "$commits_since_last_publish" >>"temp.md"
cat "Changelog.md" >>"temp.md"

rm "Changelog.md"
mv "temp.md" "Changelog.md"

#───────────────────────────────────────────────────────────────────────────────
# GIT ADD, COMMIT, PULL, AND PUSH

# needs piping stderr to stdin, since git push reports an error even on success
git add --all && git commit -m "publish" --author="🤖 automated<auto@build.sh>"
git pull && git push 2>&1

#───────────────────────────────────────────────────────────────────────────────
# INFO specific to my setup

if [[ "$OSTYPE" =~ "darwin" ]]; then
	# switch back to symlink
	cd "$VAULT_PATH/.obsidian/themes/Shimmering Focus/" || return 1
	cp "$CSS_PATH" "fallback.css"     # copy theme file for fallback
	ln -sf "fallback.css" "theme.css" # re-create symlink

	cd "$PHD_DATA_VAULT/.obsidian/themes/Shimmering Focus/" || return 1
	cp "$CSS_PATH" "fallback.css"     
	ln -sf "fallback.css" "theme.css" 

	# confirmation sound
	afplay "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/siri/jbl_confirm.caf" & # codespell-ignore

	# delete this repo folder
	rm -rf "$script_dir"              
fi
