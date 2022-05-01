#!/bin/zsh

# WHAT THIS SCRIPT DOES
# - Check the yaml from the Style Settings for errors. If there are any, the
#	 build is aborted, the errors are passed (e.g. for a notification) and the
#	 Style Settings tab is opened.
# - takes argument as commit message
#     - uses "patch" as commit message if executed without argument
#     - if the commit message contained a reference to an GitHub issue, open that GitHub issue
# - adds the commit message to the changelog
# - bumps version number in css file
# - CSS is linted and minified
# - The docs are linted and checked for invalid links
# - ToC in the CSS file is updated
# - copies css from the vault (`CSS_PATH`) into this repository
# - updates download counts in badges of the .md files
# - Markdown is linted & checked for dead links
# - adds a non-minified css file and the global stylelint.json for documentation
# - git add, commit, pull, push to the remote repo

# REQUIREMENTS
# - clean-css-cli
# - stylelint
# - markdownlint
# - markdown-link-check
# - yamllint
# - git authentication with SSH & Push Access
# - this script placed somewhere in the git repository

# ---------------------------

# CONFIG
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
CSS_PATH=~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/.obsidian/themes/Shimmering Focus.css"
CHANGELOG_PATH="./docs/changelog.md"

# ---------------------------

# YAMLLINT TEST
# - Abort build if yaml invalid
# - requires style settings placed at at the very bottom of the theme css
YAMLLINT_OUTPUT=$(sed -n '/@settings/,$p' "$CSS_PATH" | tail -n+2 | sed -e '$ d'| sed -e '$ d' | yamllint - -d relaxed --no-warnings)
if [[ $? == 1 ]]; then
	echo "YAML ERROR"
	echo "$YAMLLINT_OUTPUT" | tail -n+2
	open "obsidian://advanced-uri?settingid=obsidian-style-settings" # open Style Settings if Advanced URI plugin installed
	exit 1
fi

# get commit message
COMMIT_MSG="$*"
if [[ "$COMMIT_MSG" == "" || "$COMMIT_MSG" == " " ]] ; then
	COMMIT_MSG="patch"
fi

# if issue-related, open that issue
if [[ "$COMMIT_MSG" =~ "#" ]] ; then
	issueNo=$(echo "$COMMIT_MSG" | grep -Eo "#\d+" |cut -c 2-)
	repoURL=$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' )
	open "$repoURL"/issues/"$issueNo"
fi

# go to git root for Linters
cd "$(dirname "$0")" || exit
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"

# Linters
stylelint --fix "$CSS_PATH"
markdownlint --fix ./*.md
markdownlint --fix docs/*.md
markdown-link-check -q ./README.md
# creates too many errors with docs linking right now
# find ./docs -name \*.md -print0 | xargs -0 -n1 markdown-link-check -q

# Update ToC
printf "/* @TOC-SPLIT-MARKER */\n/*\n" > new_toc.css
grep -E "<+ " "$CSS_PATH" | sed -e "s/ \*\///" \
	-e "s/\/\* //" \
	-e "s/<<<<< /\t\t\t\t- /" \
	-e "s/<<<< /\t\t\t- /" \
	-e "s/<<< /\t\t- /" \
	-e "s/<< /\t- /" \
	-e "s/< /- /" \
	| tr -d "#" \
	| tail -n +2 \
	>> new_toc.css
split -p "@TOC-SPLIT-MARKER" "$CSS_PATH" temp
mv tempaa before_toc.css
mv tempac after_toc.css
cat before_toc.css new_toc.css after_toc.css > "$CSS_PATH"
rm new_toc.css before_toc.css tempab after_toc.css

# Bump version number
versionLine=$(grep -Ewn "^Version" "$CSS_PATH" | cut -d: -f1 | head -n1)
currentVersion=$(sed -n "${versionLine}p" "$CSS_PATH" | cut -d. -f2)
nextVersion=$((currentVersion + 1))
sed -E -i '' "${versionLine}s/(.*\.)[[:digit:]]+/\1$nextVersion/" "$CSS_PATH"

# Minify
split -p "@MINIFY-SPLIT-MARKER" "$CSS_PATH" temp # split off to prevent style settings from getting minified
mv tempaa info.css
mv tempab unminified_css_code.css
grep -vE "^# << " tempac > style_settings.css # remove yaml-navigation markers
rm tempac
cleancss unminified_css_code.css > minified_css_code.css
cat info.css minified_css_code.css style_settings.css > obsidian.css
rm info.css unminified_css_code.css minified_css_code.css style_settings.css

# ------------------------------------

# Copy for documentation purposes
cp ~/.stylelintrc.json ./
cp "$CSS_PATH" ./source.css

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" | grep -oe '"Shimmering Focus","download":[[:digit:]]*' | cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" docs/index.md

# Update changelog
printf "---\nnav_order: 110\n---\n\n# Changelog\n" > "$CHANGELOG_PATH"
echo "- ""$(date +"%Y-%m-%d")""	$COMMIT_MSG" >> "$CHANGELOG_PATH"
git log --pretty=format:"- %ad%x09%s" --date=short | grep -Ev "minor$" | grep -Ev "patch$" | grep -Ev "typos?$" | grep -v "refactoring" | grep -v "Add files via upload" | grep -Ev "\tDelete" | grep -Ev "\tUpdate.*\.md" | sed -E "s/\t\+ /\t/g" >> "$CHANGELOG_PATH"


# add to git
git add -A
git commit -m "$COMMIT_MSG"
git pull
echo -n | git push  # pass for notification
