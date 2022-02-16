#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

# ---------------------------
# Config
csspath=~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/.obsidian/themes/Shimmering Focus.css"
changelog_path="./docs/changelog.md"

# ---------------------------

# get commit message
commitMsg="$*"
if [[ "$commitMsg" == "" || "$commitMsg" == " " ]] ; then
	commitMsg="patch"
fi

# if issue-related, open that issue
if [[ "$commitMsg" =~ "#" ]] ; then
	issueNo=$(echo "$commitMsg" | grep -Eo "#\d+" |cut -c 2-)
	repoURL=$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' )
	open "$repoURL"/issues/"$issueNo"
fi

# -----------------------------

# Lint & Minify
cd "$(dirname "$0")" || exit
cd ..

stylelint --fix "$csspath"
markdownlint --fix ./*.md
markdownlint --fix docs/*.md
markdown-link-check ./README.md
find ./docs -name \*.md -print0 | xargs -0 -n1 markdown-link-check

# split off to prevent style settings from getting minified
split -p "@SPLITMARKER" "$csspath" temp
cleancss tempaa > minified.css
cat minified.css tempab > obsidian.css
rm minified.css tempaa tempab

# -------------------

# Copy for documentation purposes
cp ~/.stylelintrc.json ./
cp "$csspath" ./source.css

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" | grep -oe '"Shimmering Focus","download":[[:digit:]]*' | cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" README.md
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" docs/index.md

# Update changelog
printf "---\nnav_order: 110\n---\n\n# Changelog\n" > "$changelog_path"
echo "- ""$(date +"%Y-%m-%d")""	$commitMsg" >> "$changelog_path"
git log --pretty=format:"- %ad%x09%s" --date=short | grep -Ev "minor$" | grep -Ev "patch$" | grep -Ev "typos?$" | grep -v "refactoring" | grep -v "Add files via upload" | grep -Ev "\tDelete" | grep -Ev "\tUpdate.*\.md" | sed -E "s/\t\+ /\t/g" >> "$changelog_path"

# Bump version number
versionLine=$(grep -Ewn "^Version" "$csspath" | cut -d: -f1 | head -n1)
currentVersion=$(sed -n "${versionLine}p" "$csspath" | cut -d. -f2)
nextVersion=$(( $currentVersion + 1 ))
sed -E -i '' "${versionLine}s/(.*\.)[[:digit:]]+/\1$nextVersion/" "$csspath"

# add to git
git add -A
git commit -m "$commitMsg"
git pull
echo -n | git push  # pass for notification
