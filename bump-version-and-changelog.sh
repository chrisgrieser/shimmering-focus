#!/usr/bin/env zsh
#───────────────────────────────────────────────────────────────────────────────

# BUMP VERSION NUMBERS
theme_header="$1"

versionLine=$(grep --line-number --max-count=1 "^Version" "$theme_header")
versionLnum=$(echo "$versionLine" | cut -d: -f1)

currentVer=$(echo "$versionLine" | cut -d. -f2)
nextVer=$((currentVer + 1))

sed -E -i '' "${versionLnum} s/$currentVer/$nextVer/" "$theme_header"
sed -E -i '' "${versionLnum} s/$currentVer/$nextVer/" "./theme.css"
sed -E -i '' "/version/ s/$currentVer/$nextVer/" "./manifest.json"

#───────────────────────────────────────────────────────────────────────────────
# DOWNLOAD COUNT (in Readme.md)

dl=$(curl -s "https://releases.obsidian.md/stats/theme" |
	grep -oe '"Shimmering Focus","download":[[:digit:]]*' |
	cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" ./README.md

#───────────────────────────────────────────────────────────────────────────────
# UPDATE CHANGELOG

# only add to changelog if on `main`
if [[ "$(git branch --show-current)" == "main" ]]; then
	commits_since_last_publish=$(git log :/bump.. --format="- %cs %s")

	echo "$commits_since_last_publish" |
		grep -vE "build|ci|style|bump" |                           # don't include internal changes
		sed -E "s/^(- [0-9-]+) ([^ ]+): /\1 **\2**: /" >> "temp.md" # bold title
	grep -v "^$" "Changelog.md" >> "temp.md"
	mv -f "temp.md" "Changelog.md"
fi

# ───────────────────────────────────────────────────────────────────────────────
# COMMIT
git add "$theme_header" Changelog.md manifest.json README.md theme.css &&
	git commit -m "bump: version & update changelog" --author="🤖 bump<auto@bump.sh>"
