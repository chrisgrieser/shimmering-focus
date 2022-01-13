#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
csspath=~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/.obsidian/themes/Shimmering Focus.css"

# get commit message
commitMsg="$*"
if [[ "$commitMsg" == "" || "$commitMsg" == " " ]] ; then
	commitMsg="minor"
fi

# if issue-related, open that issue
if [[ "$commitMsg" =~ "#" ]] ; then
	issueNo=$(echo "$commitMsg" | egrep -o "#\d+" |cut -c 2-)
	repoURL=$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' )
	open "$repoURL"/issues/"$issueNo"
fi

# Stylelint & copy
stylelint --fix "$csspath"
cp "$csspath" ./obsidian.css

# Copy .stylelintrc for documentation purposes
cp ~/.stylelintrc.json ./

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" | grep -oe '"Shimmering Focus","download":[[:digit:]]*' | cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" README.md

# Update changelog
echo "- "$(date +"%Y-%m-%d")"	$commitMsg" > ./Changelog.md
git log --pretty=format:"- %ad%x09%s" --date=short | grep -Ev "minor$" | grep -Ev "typos?$" | grep -v "refactoring" | grep -v "Add files via upload" | grep -Ev "\tDelete" | grep -Ev "\tUpdate.*\.md" | sed -E "s/\t\+ /\t/g" >> ./Changelog.md

# Bump version number
versionLine=$(egrep -wn "^Version" "$csspath" | cut -d: -f1 | head -n1)
currentVersion=$(sed -n "${versionLine}p" "$csspath" | cut -d. -f2)
nextVersion=$(( $currentVersion + 1 ))
sed -E -i '' "${versionLine}s/(.*\.)[[:digit:]]+/\1$nextVersion/" "$csspath"

# add to git
git add -A
git commit -m "$commitMsg"

git pull

echo -n | git push  #pass for notification
