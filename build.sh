#!/bin/zsh

# WHAT THIS SCRIPT DOES
# - Check the yaml from the Style Settings for errors. If there are any, the
#	 build is aborted, the errors are passed (e.g. for a notification) and the
#	 Style Settings tab is opened.
# - takes argument as commit message
#     - uses "patch" as commit message if executed without argument
# - adds the commit message to the changelog
# - bumps version number in css file
# - CSS is linted and minified
# - The docs are linted and checked for invalid links
# - ToC in the CSS file is updated
# - copies css from the vault (`CSS_PATH`) into this repository
# - updates download counts in badges of the .md files
# - adds a copy of the non-minified css file and the global stylelint config for documentation
# - git add, commit, pull, and push to the remote repo

# REQUIREMENTS
# - clean-css-cli
# - stylelint
# - markdownlint
# - yamllint
# - git authentication with SSH Push Access
# - this script placed somewhere in the git repository

# ---------------------------

# CONFIG
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
CSS_PATH=~"/Main Vault/.obsidian/themes/Shimmering Focus/theme.css"
CHANGELOG_PATH="./changelog.md"

# ---------------------------

# Abort if CLIs missing
which cleancss &> /dev/null
if [[ $? == 1 ]]; then
	echo "clean-css-cli is not installed."
	exit 1
fi
which markdownlint &> /dev/null
if [[ $? == 1 ]]; then
	echo "markdownlint is not installed."
	exit 1
fi
which stylelint &> /dev/null
if [[ $? == 1 ]]; then
	echo "stylelint is not installed."
	exit 1
fi
which yamllint &> /dev/null
if [[ $? == 1 ]]; then
	echo "yamllint is not installed."
	exit 1
fi

# YAMLLINT TEST
# - Abort build if yaml invalid
# - requires style settings placed at at the very bottom of the theme css
YAMLLINT_OUTPUT=$(sed -n '/@settings/,$p' "$CSS_PATH" | grep -v "^$" | sed '1,2d;$d'| sed '$d' | yamllint - --config-data=relaxed --no-warnings)
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

# go to git root for Linters
cd "$(dirname "$0")" || exit 1
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"

# Linters
stylelint --fix "$CSS_PATH"
markdownlint --fix ./README.md

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
sed -E -i '' "s/(\"version\": \".*\.).*/\1$nextVersion\",/" "manifest.json"
SECOND_MANIFEST="$(dirname "$CSS_PATH")/manifest.json"
sed -E -i '' "s/(\"version\": \".*\.).*/\1$nextVersion\",/" "$SECOND_MANIFEST"

# Minify
split -p "@MINIFY-SPLIT-MARKER" "$CSS_PATH" temp # split off to prevent style settings from getting minified
mv tempaa info.css
mv tempab unminified_css_code.css
grep -vE "^# << " tempac > style_settings.css # remove yaml-navigation markers
rm tempac
cleancss unminified_css_code.css > minified_css_code.css
cat info.css minified_css_code.css style_settings.css > theme.css
rm info.css unminified_css_code.css minified_css_code.css style_settings.css

# ------------------------------------

# Copy for documentation purposes
cp ~/.stylelintrc.json ./
cp "$CSS_PATH" ./source.css

# Update Theme Download numbers in README.md
dl=$(curl -s "https://releases.obsidian.md/stats/theme" | grep -oe '"Shimmering Focus","download":[[:digit:]]*' | cut -d: -f2)
sed -E -i '' "s/badge.*-[[:digit:]]+-/badge\/downloads-$dl-/" ./README.md

# Update changelog
mkdir -p "$(dirname "$CHANGELOG_PATH")"
echo "# Changelog" > "$CHANGELOG_PATH"
echo "- ""$(date +"%Y-%m-%d")""	$COMMIT_MSG" >> "$CHANGELOG_PATH"
git log --pretty=format:"- %ad%x09%s" --date=short | grep -Ev "minor$" | grep -Ev "patch$" | grep -Ev "typos?$" | grep -v "refactoring" | grep -v "Add files via upload" | grep -Ev "\tDelete" | grep -Ev "\tUpdate.*\.md" | sed -E "s/\t\+ /\t/g" >> "$CHANGELOG_PATH"

# add to git
git add -A
git commit -m "$COMMIT_MSG"
git pull
echo -n | git push  # pass for notification
