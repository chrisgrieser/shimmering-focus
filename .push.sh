#!/bin/zsh
csspath=~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/.obsidian/themes/Shimmering Focus.css"

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" | grep -oe '"Shimmering Focus","download":[[:digit:]]*' | cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" README.md

# Version number bump
versionLine=$(egrep -wn "^Version" "$csspath" | cut -d: -f1 | head -n1)
currentVersion=$(sed -n "${versionLine}p" "$csspath" | cut -d. -f2)
nextVersion=$(( $currentVersion + 1 ))
sed -E -i '' "${versionLine}s/(.*\.)[[:digit:]]+/\1$nextVersion/" "$csspath"

# copy css file from vault to local repository
cp "$csspath" ./obsidian.css

# Update changelog
commitMsg="$*"
if [[ "$commitMsg" == "" || "$commitMsg" == " " ]] ; then
	commitMsg="minor"
fi

echo "- "$(date +"%Y-%m-%d")"	$commitMsg" > ./Changelog.md
git log --pretty=format:"- %ad%x09%s" --date=short | grep -Ev "minor$" | grep -Ev "typos?$" >> ./Changelog.md

# add to git
git add -A
git commit -m "$commitMsg"

# pass for notification
echo -n | git push
