#!/bin/zsh

# WHAT THIS SCRIPT DOES
# - takes argument as commit message
#     - uses "patch" as commit message if executed without argument
#     - if the commit message contained a reference to an GitHub issue, open that GitHub issue
# - adds the commit message to the changelog
# - bumps version number in css file
# - CSS is linted and minified
# - ToC in the CSS file is updated
# - copies css from the vault (`csspath`) into this repository
# - updates download counts in badges of the .md files
# - Markdown is linted & checked for dead links
# - adds a non-minified css file and the global stylelint.json for documentation purposes
# - add, commit, pull, push to the remote repo

# REQUIREMENTS
# - cssclean
# - stylelint
# - markdownlint
# - markdown-link-check
# - git authentication with SSH & Push Access
# - this script placed somewhere in the git repository

# ---------------------------

# Config
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
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

# go to git root for Linters
cd "$(dirname "$0")" || exit
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"

# Linters
stylelint --fix "$csspath"
markdownlint --fix ./*.md
markdownlint --fix docs/*.md
markdown-link-check -q ./README.md

# creates too many errors with docs linking right now
# find ./docs -name \*.md -print0 | xargs -0 -n1 markdown-link-check -q

# Update ToC
printf "/* @TOC-SPLIT-MARKER */\n/*\n" > temp_toc.css
grep -E "<+ " "$csspath" | sed -e "s/ \*\///" -e "s/\/\* //" -e "s/<<< /\t\t- /" -e "s/<< /\t- /" -e "s/< /- /" | tail -n +2 \
	>> new_toc.css
split -p "@TOC-SPLIT-MARKER" "$csspath" temp
mv tempaa before_toc.css
mv tempac after_toc.css
cat before_toc.css new_toc.css after_toc.css > "$csspath"
rm new_toc.css before_toc.css tempab after_toc.css

# Bump version number
versionLine=$(grep -Ewn "^Version" "$csspath" | cut -d: -f1 | head -n1)
currentVersion=$(sed -n "${versionLine}p" "$csspath" | cut -d. -f2)
nextVersion=$((currentVersion + 1))
sed -E -i '' "${versionLine}s/(.*\.)[[:digit:]]+/\1$nextVersion/" "$csspath"

# Minify
split -p "@MINIFY-SPLIT-MARKER" "$csspath" temp # split off to prevent style settings from getting minified
mv tempaa info.css
mv tempab unminified_css_code.css
mv tempac style_settings.css
cleancss unminified_css_code.css > minified_css_code.css
cat info.css minified_css_code.css style_settings.css > obsidian.css
rm info.css unminified_css_code.css minified_css_code.css style_settings.css

# ------------------------------------

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


# add to git
git add -A
git commit -m "$commitMsg"
git pull
echo -n | git push  # pass for notification
