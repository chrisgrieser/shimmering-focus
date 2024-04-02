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
css_path="$script_dir/theme.css"

#───────────────────────────────────────────────────────────────────────────────
# TEST: YAML VALIDATION

# - Abort build if yaml invalid
# - requires style-settings placed at the very bottom of the theme's css
npm_location="$(npm root)/.bin/"
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$npm_location:$PATH
if ! command -v yaml-validator &>/dev/null; then echo "yaml-validator not installed." && return 1; fi

sed -n '/@settings/,$p' "$css_path" | sed '1d;$d' | sed '$d' >temp.yml
yamllint_output=$(yaml-validator temp.yml)
if [[ $? == 1 ]]; then
	echo "YAML ERROR"
	echo "$yamllint_output" | sed '1d'
	return 1
fi
rm temp.yml

#───────────────────────────────────────────────────────────────────────────────
# BUMP VERSION NUMBER

versionLine=$(grep --line-number --max-count=1 "^Version" "theme.css")
versionLnum=$(echo "$versionLine" | cut -d: -f1)

currentVer=$(echo "$versionLine" | cut -d. -f2)
nextVer=$((currentVer + 1))

manifest="$(dirname "$css_path")/manifest.json"
sed -E -i '' "${versionLnum} s/$currentVer/$nextVer/" "$css_path"
sed -E -i '' "/version/ s/$currentVer/$nextVer/" "$manifest"

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" |
	grep -oe '"Shimmering Focus","download":[[:digit:]]*' |
	cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" ./README.md

#───────────────────────────────────────────────────────────────────────────────
# CHANGELOG
commits_since_last_publish=$(git -C "$script_dir" log :/publish.. --format="- %cs %s")

echo "$commits_since_last_publish" | sed -E "s/^- ([^ ]+): /- **\1**: /" >>"temp.md"
grep -v "^$" "Changelog.md" >>"temp.md"
mv -f "temp.md" "Changelog.md"

#───────────────────────────────────────────────────────────────────────────────
# GIT ADD, COMMIT, PULL, AND PUSH

# needs piping stderr to stdin, since git push reports an error even on success
git add --all && git commit -m "publish" --author="🤖 automated<auto@build.sh>"
git pull && git push 2>&1

#───────────────────────────────────────────────────────────────────────────────
# INFO specific to my setup

if [[ "$OSTYPE" =~ "darwin" ]]; then
	# switch back to symlink
	while read -r line; do
		repo_path=$(echo "$line" | cut -d, -f2 | sed "s|^~|$HOME|")
		theme_path="$repo_path/.obsidian/themes/Shimmering Focus"
		[[ -d "$theme_path" ]] || continue
		cd "$theme_path" || return 1

		cp "$css_path" "fallback.css"     # copy theme file for fallback
		ln -sf "fallback.css" "theme.css" # re-create symlink
	done <"$HOME/.config/perma-repos.csv"

	# confirmation sound
	afplay "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/siri/jbl_confirm.caf" & # codespell-ignore

	# delete this repo folder
	rm -rf "$script_dir"
fi
